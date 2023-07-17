#!/bin/bash
# Backup for each folder
folder=/path
bucket=boto3+s3:///bucket-name
region=us-ch # Chicago example
s3_endpoint=https://url.endpoint

export AWS_ACCESS_KEY_ID=""
export AWS_SECRET_ACCESS_KEY=""
export PASSPHRASE="" #encryption password

duplicity --s3-region-name=$region --s3-endpoint-url=$s3_endpoint "$folder" "$bucket"

unset AWS_ACCESS_KEY_ID
unset AWS_SECRET_ACCESS_KEY
unset PASSPHRASE
