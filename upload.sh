#!/bin/sh
set -eu
cd "$(dirname "$0")"
mkdir -p srfi/support
curl --location --fail --silent --show-error -o srfi/support/index.html \
    https://raw.githubusercontent.com/schemedoc/srfi-metadata/master/table.html
curl --location --fail --silent --show-error -o schemeorg.css \
    https://www.staging.scheme.org/schemeorg.css
rsync -crv index.html srfi schemeorg.css \
    alpha.servers.scheme.org:/production/doc/www/
