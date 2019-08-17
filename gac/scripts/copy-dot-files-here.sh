rm -rf dot-files
mkdir -p dot-files
find ~ -type f -name '.[a-z]*' -maxdepth 1 | grep -v 'configstore/\|.ssh/' | xargs -I{} cp {} dot-files
# DON'T COPY ANY SECRETS. That includes .aws/credentials .ssh/*
cp -rp ~/.iterm2 dot-files
