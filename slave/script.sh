#!/bin/bash

#обновляем репо и уcтанавливаем mysql
apt update && apt install mysql-server -y

#запускаем
systemctl start mysql

cp ./otus/db_slave/mysqld.cnf /etc/mysql/mysql.conf.d/mysqld.cnf

systemctl restart mysql

mysql -u root << EOF

CHANGE REPLICATION SOURCE TO SOURCE_HOST='192.168.11.23', SOURCE_USER='repl', SOURCE_PASSWORD='oTUSlave#2020', SOURCE_AUTO_POSITION = 1, GET_SOURCE_PUBLIC_KEY = 1;
START SLAVE;
EOF


