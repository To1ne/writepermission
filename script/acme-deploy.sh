#!/bin/sh
set -e

mkdir -p .well-known/acme-challenge/

echo $CERTBOT_VALIDATION > .well-known/acme-challenge/$CERTBOT_TOKEN

git add .well-known

git commit -m'[auto] Update ACME challenges'

git push origin master

n=0
until [ $n -ge 60 ]
do
    http_code=$(curl -s -o /dev/null -I -w "%{http_code}" https://iotcl.com/.well-known/acme-challenge/$CERTBOT_TOKEN)
    [ $http_code -eq 200 ] && break
    echo "Failure $http_code. Retry in 30 seconds..."
    n=$((n+1))
    sleep 30
done

echo "\n\nChallenge $CERTBOT_TOKEN deployed!"
