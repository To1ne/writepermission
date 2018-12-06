#!/bin/sh
set -e

for domain in $RENEWED_DOMAINS
do
  curl --request PUT --header "PRIVATE-TOKEN: $GITLAB_TOKEN" \
       --form "certificate=@$RENEWED_LINEAGE/fullchain.pem" \
       --form         "key=@$RENEWED_LINEAGE/privkey.pem" \
       https://gitlab.com/api/v4/projects/to1ne%2fresume/pages/domains/$domain
done

echo "\n\nCertificates for $RENEWED_DOMAINS installed!"
