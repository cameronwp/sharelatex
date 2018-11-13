#!/bin/bash

# copy newest files to latest position to avoid expiration

BUCKET=BUCKET_NAME
MONGODB_DUMP=$(date +mongodb_%Y%m%d.gz)
REDIS_DUMP=$(date +redis_%Y%m%d.gz)
DATA_DIR_ZIP=$(date +data_%Y%m%d.tar.gz)

~/.local/bin/aws s3 cp s3://$BUCKET/sharelatex/temp/$MONGODB_DUMP s3://$BUCKET/sharelatex/latest_mongodb.gz
~/.local/bin/aws s3 cp s3://$BUCKET/sharelatex/temp/$DATA_DIR_ZIP s3://$BUCKET/sharelatex/latest_data.tar.gz
~/.local/bin/aws s3 cp s3://$BUCKET/sharelatex/temp/$REDIS_DUMP s3://$BUCKET/sharelatex/latest_redis.gz

