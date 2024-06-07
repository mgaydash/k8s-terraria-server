#!/bin/bash

usage() {
  echo "S3_ADMIN_AWS_ACCESS_KEY_ID and S3_ADMIN_AWS_SECRET_ACCESS_KEY should be set"
}

RELEASE_NAME="terraria-server"

if [[ "${S3_ADMIN_AWS_ACCESS_KEY_ID}" == "" ]] || [[ "${S3_ADMIN_AWS_SECRET_ACCESS_KEY}" == "" ]]; then
  usage
  exit 1
fi

helm upgrade \
  --install \
  --set "aws_access_key_id=${S3_ADMIN_AWS_ACCESS_KEY_ID}" \
  --set "aws_secret_access_key=${S3_ADMIN_AWS_SECRET_ACCESS_KEY}" \
  --set "hosted_zone_id=${S3_ADMIN_AWS_HOSTED_ZONE_ID}" \
  --values ./values.yaml \
  ${RELEASE_NAME} \
  .
