# Provision ELK Instance with Terraform
In this demo, we will deploy an ELK server in AWS using EC2 instance. 
## About ELK
ELK stands for **Elasticsearch**, **Logstash**, and **Kibana**, each of these tools are Open-Source and can be used Independently. They provide a solution to the common problem, ie eﬃciently store, search and visualize large text files or logs. This will help us to debug Issurs in production. 
#### Elastisearch
ES is central component of the ELK stack. Elasticsearch oﬀers multi-node (scalable) distributed search and analytics engine. It Stores and indexes data centrally and provides REST API access to it.
#### Logstash
Input for ES. Logstash can receive logs or text files from diﬀerent sources, transform it, and send it Elasticsearch.
#### Kibana
Kibana gives a UI to Elasticsearch, using which you can visualize and navigate the data stored in Elasticsearch.
