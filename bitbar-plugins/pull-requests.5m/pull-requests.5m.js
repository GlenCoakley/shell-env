#!$NVM_DIR/versions/node/v10.21.0/bin/node
// #!/usr/bin/env node
// jshint esversion: 6, asi: true

// <bitbar.title>Github Pull requests</bitbar.title>
// <bitbar.version>v2.0</bitbar.version>
// <bitbar.author>Noam Knispel</bitbar.author>
// <bitbar.author.github>noamknispel</bitbar.author.github>
// <bitbar.desc>Get list of pull requests from Github for multiple repositories</bitbar.desc>
// <bitbar.dependencies>node.js request co bluebird</bitbar.dependencies>

// Github API v3 docs:
//    https://developer.github.com/v3/pulls/#list-pull-requests
//    https://developer.github.com/v3/pulls/reviews/

// EDIT YOUR INFO BELOW:
const secrets = require(process.env.HOME + '/.ssh/drc.secrets.json');
const token = secrets.githubAccessToken;
const username = secrets.githubUserName;
var githubReposURL = 'https://api.github.com/repos/DataRecognitionCorporation/'
var repos = require('../config/github-projects.json')
//GLEN repos = ['eca-online-scoring-api']
// DO NOT EDIT BELOW THIS POINT

var bluebird = require("bluebird")
var request = bluebird.promisifyAll(require("request"))
var co = require("co")
var fetch = require("node-fetch")

co(function* () {
  var REQ_OPTS = {
    headers: {
      'User-Agent': username + ' - bitbar'
    },
    auth: {
      user: username,
      password: token
    }
  };
	//console.log("Request options:", REQ_OPTS);
	
  var results = yield repos.map(function(repo) { //jshint ignore:line
    var options = { ...REQ_OPTS, url: githubReposURL + repo + '/pulls' };
    //console.log('GLEN Requesting:', options);
    return request.getAsync(options);
  })

  var totalCount = 0;
  var pullRequestList = results.reduce( (acc, response) => {
    var prInfo = JSON.parse(response.body);
  
	  if (prInfo.message) { 
      // Display error if there were no pull requests.
      if (prInfo.message !== 'Not Found') {
        console.error(prInfo.message);
      }
    }
    else if (prInfo.length > 0) {
      //console.log('GLEN PR info. response:', info, '\n');
      totalCount += prInfo.length;
      acc.push(prInfo[0].base.repo.name + ' | color="#000088"' /* dark blue */);

      prInfo.forEach(async function(pr) {
/*GLEN
        var reviewsResponse = await fetch(pr.url + '/reviews', REQ_OPTS);
				var reviewResultsText = await reviewsResponse.text();
				//console.log('GLEN Review response: ', reviewResultsText);
				var reviewResults = JSON.parse(reviewResultsText);
  
	      for (var revResult of reviewResults) {
*/
//GLEN        var statusColor = reviewResult.state === 'APPROVED' ? '#008800' /* dark green */ : '#888800' /* dark yellow */;
				var statusColor = 'black';
          acc.push('#' + pr.number + ' ' + pr.title + ' (' + pr.user.login + ') | href=' + pr.html_url + 
              ' color=' + statusColor);
//GLEN        }
      })
    }
    return acc;
  }, ['---'] )

  pullRequestList.unshift(`${totalCount} Pull Request${totalCount != 1 ? "s" : ""}`)
  for(var pr of pullRequestList) {
    console.log(pr);
  }
}).catch(function() {});
