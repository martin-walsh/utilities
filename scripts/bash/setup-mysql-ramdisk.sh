#!/bin/bash

docker run --name cmdb --tmpfs /var/lib/mysql:rw --rm -d -p 3306:3306 278521702583.dkr.ecr.us-west-2.amazonaws.com/cm/cm-test-db:mysql_5.6_v2.6.0

until docker exec cmdb mysqladmin --silent ping; do
  echo "Waiting for mysqld to start. Retry in 5s..."
  sleep 5
done

until mysql -h 127.0.0.1 -P 3306 -u root siteminder_unit -e "show tables"; do
  echo "Waiting for connect. Retry in 5s..."
  sleep 5
done

source $HOME/bin/lib/migrate-database.sh
