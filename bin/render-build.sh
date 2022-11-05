#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
curl --create-dirs -o $HOME/.postgresql/root.crt -O https://cockroachlabs.cloud/clusters/7ae464c2-e293-4708-957a-373ade476566/cert
bundle exec rake db:migrate