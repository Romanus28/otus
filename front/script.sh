#!/bin/bash

apt update && apt install nginx prometheus-node-exporter nfs-common mysql-server -y

cp ./otus/frontend/default /etc/nginx/sites-available/

nginx -t && systemctl reload nginx

mkdir ./nas

mount 192.168.11.27:/srv/nfs ./nas

dpkg -i ./nas/elk/filebeat_8.17.1_amd64.deb

cp ./otus/frontend/filebeat.yml /etc/filebeat/

systemctl restart filebeat

systemctl start mysql

cp ./otus/front/mysqld.cnf /etc/mysql/mysql.conf.d/mysqld.cnf

systemctl restart mysql

mysql -u root << EOF

CHANGE REPLICATION SOURCE TO SOURCE_HOST='192.168.11.20', SOURCE_USER='repl', SOURCE_PASSWORD='oTUSlave#2020', SOURCE_AUTO_POSITION = 1, GET_SOURCE_PUBLIC_KEY = 1;
START SLAVE;
EOF
