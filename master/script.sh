#!/bin/bash

#обновляем репо и уcтанавливаем mysql
apt update && apt install mysql-server -y

#запускаем
systemctl start mysql

cp ./otus/db_master/mysqld.cnf /etc/mysql/mysql.conf.d/mysqld.cnf

systemctl restart mysql

mysql << EOF

CREATE USER repl@'%' IDENTIFIED WITH 'caching_sha2_password' BY 'oTUSlave#2020';
GRANT REPLICATION SLAVE ON *.* TO repl@'%';
CREATE DATABASE otus;
EOF

mysql otus < ./otus/db_master/otus.sql


