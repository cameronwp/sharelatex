#!/bin/bash

# https://github.com/sharelatex/sharelatex/wiki/Backup-of-Data

BUCKET=BUCKET_NAME
MONGODB_DUMP=$(date +mongodb_%Y%m%d.gz)
REDIS_DUMP=$(date +redis_%Y%m%d.gz)
DATA_DIR_ZIP=$(date +data_%Y%m%d.tar.gz)

# For whatever reason, ~/.local/bin/aws s3 is ignoring the --expires option. expiration is controlled in the console
# ONE_MONTH_FROM_NOW=$(date -d "`date +%Y%m%d` +3 months" +"%Y-%m-%dT%H:%M:%SZ")

mongodump --archive | gzip | ~/.local/bin/aws s3 cp - s3://$BUCKET/sharelatex/temp/$MONGODB_DUMP
tar -cv ~/.sharelatex/data | gzip | ~/.local/bin/aws s3 cp - s3://$BUCKET/sharelatex/temp/$DATA_DIR_ZIP
tar -cv ~/.sharelatex/redis_data | gzip | ~/.local/bin/aws s3 cp - s3://$BUCKET/sharelatex/temp/$REDIS_DUMP

