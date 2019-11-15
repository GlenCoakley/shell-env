#!/bin/sh

cd $(dirname $0)/..
DOT_DIR=dot-files
mkdir -p $DOT_DIR

# DON'T COPY ANY SECRETS. That includes .aws/credentials .ssh/*
find ~ -type f -name '.[a-z]*' -maxdepth 1 | \
	grep -v 'configstore/\|history\|hst\|serverauth\|.rnd\|.vminfo\|.aws/credentials\|.ssh/' | \
	xargs -I{} cp {} $DOT_DIR

echo "Files ~/.*, excluding ~/.ssh/, have been copied to $(pwd)/$DOT_DIR"

