#!/bin/sh
set -e

composer install 
./bin/console cache:clear

exec "$@"
# exec bundle exec "$@"
