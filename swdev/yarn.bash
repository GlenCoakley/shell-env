
function yari() { yarn remove $@; yarn cache clean $@; yarn add $@; }

alias yarn='yarn --prefer-offline'

