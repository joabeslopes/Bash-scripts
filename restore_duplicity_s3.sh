#!/bin/bash

# Restore the things that were sent with the backup script.

folder=/path
bucket=boto3+s3:///bucket-name
region=us-ch # Chicago example
s3_endpoint=https://url.endpoint

export AWS_ACCESS_KEY_ID=""
export AWS_SECRET_ACCESS_KEY=""
export PASSPHRASE="" #Encryption password

duplicity restore --force --s3-region-name=$region --s3-endpoint-url=$s3_endpoint "$bucket" "$folder"

unset AWS_ACCESS_KEY_ID
unset AWS_SECRET_ACCESS_KEY
unset PASSPHRASE
