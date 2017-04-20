#!/usr/bin/env bash

STATIC_PATH=./static/
ENVVARS=$@

function dosub {
  VAR_NAME="${1}_VAL"
  SANATIZED_VALUE=$(echo ${!VAR_NAME} | sed -e 's/[\/&]/\\&/g')
  echo "Replacing $1 in all static content starting at path $STATIC_PATH with contents of $VAR_NAME which is $SANATIZED_VALUE"
  find $STATIC_PATH -type f -print0 | LC_ALL=C xargs -0 sed -i "s/${1}_ENV/${SANATIZED_VALUE}/g"
}

for VAR in "$@"; do
  NEW_VALUE=${!VAR}
  dosub $VAR $NEW_VALUE
done
