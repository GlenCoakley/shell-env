#
# Nodejs development
#

#----------------------------
# Environment variables
#----------------------------
# Setting BROWSER stops Karma from complaining:
#    browser_gpu_channel_host_factory.cc(121)] Failed to launch GPU process.
export BROWSER=google-chrome
export NPM_GCACHE="$GAC_DEV_DIR/runtime/npm_global"
export PATH=$PATH:./node_modules/.bin:/dev/runtime/npm_cache

source $GAC_CFG_DIR/swdev/npm-completion.bash-i

#----------------------------
# Functions
#----------------------------
function goto_pkg_json() {
  [ ! -r package.json ] && [ -r app/package.json ] && cd app;
  [ ! -r package.json ] && [ $(basename $PWD) = "app" ] && cd ..;
}

function nprei() { npm uninstall $@; npm cache clean; npm install $@; }
function wksp() { cdToIfExists $WKSP/$1 && goto_pkg_json; }

#----------------------------
# Aliases
#----------------------------
alias diff="\diff -bx package-lock.json -x node_modules"

# https://docs.npmjs.com/misc/config
# npm's "--cache-min Infinity" has been deprecated for "--prefer-offline".
alias npmo='\npm --prefer-offline'
alias ngs='ng serve -v --port 4321'
alias ni='goto_pkg_json; [ -r package.json ] && npmo install'
alias no='npmo'
alias npiu='\npm prune && npmo install && npmo update'
alias nss='npm-show-scripts'

alias nr='npmo run'
alias nb='npm run build'
alias ns='npm run start'
alias nt='npm run test'
alias nti='npm run test:integration'
alias ntu='npm run test:unit'

