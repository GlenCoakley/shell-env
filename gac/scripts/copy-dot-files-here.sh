rm -rf dot-files
mkdir -p dot-files
find ~ -type f -name '.[a-z]*' -maxdepth 1 | grep -v 'configstore/update-notifier-' | xargs -I{} cp {} dot-files
# DON'T COPY ANY SECRETS. That includes .aws/credentials .ssh/*
cp -rp ~/.iterm2 ~/.vscode dot-files
