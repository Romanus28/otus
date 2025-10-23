#!/bin/bash

apt update

apt install apache2 prometheus-node-exporter mysql-server -y

mkdir /var/www/html1 && mkdir /var/www/html2
cp ./otus/back/index1.html /var/www/html1/index.html
cp ./otus/back/index2.html /var/www/html2/index.html
cp ./otus/back/ports.conf /etc/apache2/
cp ./otus/back/balance.conf /etc/apache2/sites-available/
ln -s /etc/apache2/sites-available/balance.conf /etc/apache2/sites-enabled/balance.conf

systemctl restart apache2

systemctl start mysql

cp ./otus/back/mysqld.cnf /etc/mysql/mysql.conf.d/mysqld.cnf

systemctl restart mysql

mysql << EOF

CREATE USER repl@'%' IDENTIFIED WITH 'caching_sha2_password' BY 'oTUSlave#2020';
GRANT REPLICATION SLAVE ON *.* TO repl@'%';
CREATE DATABASE otus;
EOF

mysql otus < ./otus/back/otus.sql
