rm -rf dot-files
mkdir -p dot-files
find ~ -type f -name '.[a-z]*' -maxdepth 1 | xargs -I{} cp {} dot-files
cp -rp ~/.aws ~/.ssh ~/.iterm2 ~/.vscode dot-files
