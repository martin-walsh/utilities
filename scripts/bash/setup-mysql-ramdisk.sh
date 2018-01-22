#!/usr/bin/env bash

docker pull 278521702583.dkr.ecr.us-west-2.amazonaws.com/cm/cm-test-db:mysql_5.6_cm_ari_master

docker pull 278521702583.dkr.ecr.us-west-2.amazonaws.com/cm/cm-test-db:mysql_5.6_cm_master

docker run --name aridb --tmpfs /var/lib/mysql:rw --rm -d -p 3307:3306 278521702583.dkr.ecr.us-west-2.amazonaws.com/cm/cm-test-db:mysql_5.6_cm_ari_master

docker run --name cmdb --tmpfs /var/lib/mysql:rw --rm -d -p 3306:3306 278521702583.dkr.ecr.us-west-2.amazonaws.com/cm/cm-test-db:mysql_5.6_cm_master

docker exec aridb bash -c "ln -sf /usr/share/zoneinfo/Australia/Sydney /etc/localtime"
docker exec cmdb bash -c "ln -sf /usr/share/zoneinfo/Australia/Sydney /etc/localtime"

until docker exec cmdb mysqladmin --silent ping; do
  echo "Waiting for mysqld to start. Retry in 5s..."
  sleep 5
done

until mysql -h 127.0.0.1 -P 3306 -u root siteminder_unit -e "show tables"; do
  echo "Waiting for connect. Retry in 5s..."
  sleep 5
done

source $HOME/bin/lib/migrate-database.sh
