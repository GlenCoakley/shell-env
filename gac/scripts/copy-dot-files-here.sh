mkdir -p dot-files
# DON'T COPY ANY SECRETS. That includes .aws/credentials .ssh/*
find ~ -type f -name '.[a-z]*' -maxdepth 1 | \
	grep -v 'configstore/\|history\|hst\|serverauth\|.rnd\|.vminfo\|.aws/credentials\|.ssh/' | \
	xargs -I{} cp {} dot-files

