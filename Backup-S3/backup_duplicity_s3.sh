#!/bin/bash

# Backup compressed and encrypted things to Amazon S3 compatible storage, like Idrive E2. 
# If you use Amazon S3, i recommend to use glacier for this purpose.

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
