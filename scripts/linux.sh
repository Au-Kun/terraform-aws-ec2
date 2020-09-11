#!/bin/bash

sudo yum -y install epel-release.noarch jq nmap.x86_64 wget tree vim net-tools tmux git java-1.8.0

sudo rpm -Uvh https://repo.rundeck.org/latest.rpm

sudo yum -y install rundeck

systemctl --now enable rundeckd