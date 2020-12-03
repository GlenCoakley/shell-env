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
const logFileName = process.env.HOME + '/.config/bitbar-plugins/pull-requests.5m/pull-requests.log';
const secrets = require(process.env.HOME + '/.ssh/drc.secrets.json');
const token = secrets.githubAccessToken;
const username = secrets.githubUserName;
var githubReposURL = 'https://api.github.com/repos/DataRecognitionCorporation/'
var repos = require('../config/github-projects.json')
	//GLEN repos = ['eca-online-scoring-api']
	// DO NOT EDIT BELOW THIS POINT

var bluebird = require("bluebird");
var co = require("co");
var fetch = require("node-fetch");
var fs = require("fs");
var request = bluebird.promisifyAll(require("request"));

function logMsg(...text) {
	const textArray = Array.isArray(text) ? text : [text];
	const message = textArray
		.map((el) => (typeof el == 'string') ? el : JSON.stringify(el, null, 2))
		.join(' ');
  fs.writeFileSync(logFileName, message + '\n', {flag: 'a'});
}

co(function*() {
	var REQ_OPTS = {
		headers: {
			'User-Agent': username + ' - bitbar'
		},
		auth: {
			user: username,
			password: token
		}
	};

	if (fs.existsSync(logFileName)) {
		fs.unlinkSync(logFileName);
	}
	logMsg('Request options: ', REQ_OPTS);

	var results = yield repos.map(function(repo) { //jshint ignore:line
  	var options = {...REQ_OPTS,
			url: githubReposURL + repo + '/pulls'
		};
		logMsg('Requesting URL: ', githubReposURL + repo + '/pulls');
		return request.getAsync(options);
	});

	var totalCount = 0;
	var pullRequestList = results.reduce((acc, response) => {
		var prInfo = JSON.parse(response.body);

		if (prInfo.message) {
			// Display error if there were no pull requests.
			if (prInfo.message !== 'Not Found') {
				console.error(prInfo.message);
			}
		} else if (prInfo.length > 0) {
			logMsg('PR info. response: ', prInfo, '\n');
			totalCount += prInfo.length;
			acc.push(prInfo[0].base.repo.name + ' | color="#000088"' /* dark blue */ );

			prInfo.forEach(async function(pr) {
				var reviewsResponse = await fetch(pr.url + '/reviews');
				var reviewResultsText = await reviewsResponse.text();
				logMsg('Review response: ', reviewResultsText);
				var reviewResults = JSON.parse(reviewResultsText);

				if (reviewResults && !reviewResults.message) {
					for (var revResult of reviewResults) {
						//GLEN        var statusColor = reviewResult.state === 'APPROVED' ? '#008800' /* dark green */ : '#888800' /* dark yellow */;
						var statusColor = 'black';
						acc.push('#' + pr.number + ' ' + pr.title + ' (' + pr.user.login + ') | href=' + pr.html_url +
							' color=' + statusColor);
					}
				}
			})
		}
		return acc;
	}, ['---'])

	pullRequestList.unshift(`${totalCount} Pull Request${totalCount != 1 ? "s" : ""}`)
	for (var prOutput of pullRequestList) {
		console.log(prOutput);
	}
}).catch(function() {});
