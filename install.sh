#!/bin/bash


# Not supported yet database
#frontbase/ibm_db/sqlserver/jdbcmysql/jdbcsqlite3/jdbcpostgresql/jdbc
red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`

echo "${green}====================================================="
echo "${green}====== GENERATING A NEW SYMFONY APP ================="
echo "${green}====================================================="
echo "${green}-"
echo "${green}-"

echo "${reset}"
sudo cp .env.default .env
sudo docker-compose build
sudo docker-compose run app composer create-project symfony/skeleton app
sudo cp -a app/ .  
sudo rm -rf app 
sudo composer require --dev symfony/web-server-bundle
