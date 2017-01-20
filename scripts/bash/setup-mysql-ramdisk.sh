#!/bin/bash

create-ram-disk 1024

MYSQL_BASEDIR=/usr/local/mysql
MYSQL_DATA_DIR=/Volumes/ram_disk/mysql/data
MYSQL_TMP_DIR=/Volumes/ram_disk/mysql/tmp
MYSQL_SOCKET=/Volumes/ram_disk/mysql/my_ramdisk.sock
MYSQL_CONFIG_FILE=/Volumes/ram_disk/mysql/my_ramdisk.cnf
MYSQL_PORT=3306

mkdir -p $MYSQL_DATA_DIR
mkdir -p $MYSQL_TMP_DIR

chown -R _mysql /Volumes/ram_disk/mysql
chgrp -R wheel /Volumes/ram_disk/mysql

cat << MYSQL_CONFIG_TPL > $MYSQL_CONFIG_FILE
[mysqld]
port = $MYSQL_PORT
socket = $MYSQL_SOCKET
max_allowed_packet = 10M
sort_buffer_size = 512K
read_buffer_size = 512K
read_rnd_buffer_size = 256K
net_buffer_length = 2K
thread_stack = 256K
lower_case_table_names = 1

query_cache_size  = 0

thread_cache_size = 8

collation_server=utf8_unicode_ci
character_set_server=utf8

# Replication
server_id = 1

innodb_file_per_table
innodb_data_home_dir = $MYSQL_DATA_DIR
innodb_data_file_path = ibdata1:50M:autoextend
innodb_log_group_home_dir = $MYSQL_DATA_DIR
innodb_buffer_pool_size = 512M
# innodb_buffer_pool_size = 4096M
innodb_log_file_size = 256M
innodb_log_buffer_size = 16M
innodb_flush_log_at_trx_commit = 0
innodb_lock_wait_timeout = 50

innodb_flush_method = O_DIRECT
innodb_write_io_threads = 64
innodb_read_io_threads = 64

performance_schema = OFF
innodb_checksum_algorithm = none

# The following options will be passed to all MySQL clients
[client]
user            = root
password        = xxx
port            = $MYSQL_PORT
socket          = $MYSQL_SOCKET
default-character-set = utf8

MYSQL_CONFIG_TPL

$MYSQL_BASEDIR/scripts/mysql_install_db --defaults-file=$MYSQL_CONFIG_FILE --basedir=$MYSQL_BASEDIR --datadir=$MYSQL_DATA_DIR --tmpdir=$MYSQL_TMP_DIR

chown -R _mysql /Volumes/ram_disk/mysql
chgrp -R wheel /Volumes/ram_disk/mysql

$MYSQL_BASEDIR/bin/mysqld_safe --defaults-file=$MYSQL_CONFIG_FILE --basedir=$MYSQL_BASEDIR --datadir=$MYSQL_DATA_DIR --tmpdir=$MYSQL_TMP_DIR &
sleep 5


echo "Started MySQL"
$MYSQL_BASEDIR/bin/mysqladmin --defaults-file=$MYSQL_CONFIG_FILE -u root

source $HOME/bin/lib/create-ramdisk-database.sh

echo "Login using: mysql -P $MYSQL_PORT -u root -S $MYSQL_SOCKET"
