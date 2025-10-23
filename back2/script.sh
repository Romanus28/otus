#!/bin/bash

apt update

apt install apache2 prometheus-node-exporter -y

cp ./otus/backend2/index.html /var/www/html/
