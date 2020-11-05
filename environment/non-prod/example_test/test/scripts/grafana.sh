#!/bin/bash

PACKAGE_TAG_VER=v2.22.0
PACKAGE_NAME=$PACKAGE_TAG_VER/prometheus-2.22.0.linux-amd64.tar.gz

NODE_EXPORTER_TAG_VER=v1.0.1
NODE_EXPORTER=$NODE_EXPORTER_TAG_VER/node_exporter-1.0.1.linux-amd64.tar.gz

sudo useradd --no-create-home --shell /bin/false prometheus
sudo useradd --no-create-home --shell /bin/false node_exporter



#Installing and Runing Prometheus

sudo mkdir -p /etc/prometheus
sudo mkdir -p /var/lib/prometheus

sudo chown -R prometheus:prometheus /etc/prometheus/
sudo chown -R prometheus:prometheus /var/lib/prometheus/


cd /tmp/
curl -LO https://github.com/prometheus/prometheus/releases/download/$PACKAGE_NAME

tar -xvf prometheus-* && cd prometheus-*


sudo cp prometheus /usr/local/bin/
sudo cp promtool /usr/local/bin/

sudo cp -r consoles/ /etc/prometheus/
sudo cp -r console_libraries/ /etc/prometheus/
sudo cp prometheus.yml /etc/prometheus/


#sudo vim /etc/prometheus/prometheus.yml #upload to S3
sudo -u prometheus aws s3 cp s3://alturamso/production/monitoring/prometheus/configs/prometheus.yml /etc/prometheus/

#Start Prometheus
sudo /usr/local/bin/prometheus --config.file /etc/prometheus/prometheus.yml --storage.tsdb.path /var/lib/prometheus/ --web.console.templates=/etc/prometheus/console --web.console.libraries=/etc/prometheus/console_libraries/

#Create Service #upload to S3
#sudo vim /etc/systemd/system/prometheus.service
sudo -u prometheus aws s3 cp s3://alturamso/production/monitoring/prometheus/configs/prometheus.service /etc/systemd/system/


sudo systemctl daemon-reload
sudo systemctl status prometheus
sudo systemctl enable prometheus


########################################################

# Installing and running Node_Exporter

cd ../

curl -LO https://github.com/prometheus/node_exporter/releases/download/$NODE_EXPORTER


tar -xvf node_exporter-* && cd node_exporter-*


sudo cp node_exporter /usr/local/bin
sudo chown node_exporter:node_exporter /usr/local/bin/node_exporter


sudo systemctl daemon-reload
sudo systemctl start node_exporter
sudo systemctl enable node_exporter


####################################

# Installing Grafana

GF_PACKAGE_VER=grafana-7.2.2-1.x86_64.rpm

curl -LO https://dl.grafana.com/oss/release/$GF_PACKAGE_VER

sudo yum install -y $GF_PACKAGE_VER


# Download .ini from s3
sudo aws s3 cp s3://alturamso/production/monitoring/grafana/configs/grafana.ini /etc/grafana/
sudo aws s3 cp s3://alturamso/production/monitoring/grafana/configs/ldap.toml /etc/grafana/

sudo chown root:grafana /etc/grafana/grafana.ini
sudo chown root:grafana /etc/grafana/ldap.toml




sudo systemctl start grafana-server.service
sudo systemctl enable grafana-server.service
