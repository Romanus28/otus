#!/bin/bash


apt update && apt install -y prometheus adduser libfontconfig1 musl nfs-common

mkdir ./nas

mount 192.168.11.27:/srv/nfs ./nas

dpkg -i ./nas/grafana/grafana_11.2.2_amd64-224190-264c1b.deb

#запускаем
systemctl daemon-reload
systemctl enable --now grafana-server

cp ./otus/monitoring/prometheus.yml /etc/prometheus/

systemctl restart prometheus
