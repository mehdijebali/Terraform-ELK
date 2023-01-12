#!/bin/bash

sudo yum update
sudo yum install java-1.8.0 -y
sudo java -version

# import ELK repository
sudo rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch

# install elasticsearch
cat <<EOF > /etc/yum.repos.d/elasticsearch.repo
[elasticsearch-8.x]
name=Elasticsearch repository for 8.x packages
baseurl=https://artifacts.elastic.co/packages/8.x/yum
gpgcheck=1
gpgkey=https://artifacts.elastic.co/GPG-KEY-elasticsearch
enabled=1
autorefresh=1
type=rpm-md
EOF
sudo yum -y install elasticsearch
sudo mv /tmp/elasticsearch.yml /etc/elasticsearch/elasticsearch.yml
sudo systemctl enable elasticsearch.service
sleep 10

# install logstash
sudo yum -y install logstash
sudo mv /tmp/apache-01.conf /etc/logstash/conf.d/apache-01.conf
sudo systemctl enable logstash
sleep 10

# install kibana
sudo yum -y install kibana
sudo mv /tmp/kibana.yml /etc/kibana/kibana.yml
sudo systemctl enable kibana
sleep 10

# install filebeats
sudo yum -y install filebeat
sudo filebeat modules enable system
