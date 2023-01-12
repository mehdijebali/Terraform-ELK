#!/bin/bash

sudo yum update
sudo yum install java-1.8.0 -y
sudo java -version

# install elasticsearch
wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.15.2-x86_64.rpm
wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.15.2-x86_64.rpm.sha512

sha512sum -c elasticsearch-7.15.2-x86_64.rpm.sha512

sudo rpm --install elasticsearch-7.15.2-x86_64.rpm
sleep 10
sudo mv /tmp/elasticsearch.yml /etc/elasticsearch/elasticsearch.yml
sudo systemctl enable elasticsearch.service

# install logstash
sudo apt-get install logstash
sleep 10

# install kibana
sudo apt-get install kibana
sleep 10

sudo mv /tmp/kibana.yml /etc/kibana/kibana.yml
sudo systemctl enable kibana

# install filebeats
sudo apt-get install metricbeat
sleep 10
sudo systemctl enable metricbeat

# Start LogStash
sudo mv /tmp/apache-01.conf /etc/logstash/conf.d/apache-01.conf
sleep 10
sudo systemctl enable logstash