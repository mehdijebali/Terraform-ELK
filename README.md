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
## Instructions
1. Clone the project 
```
git clone https://github.com/mehdijebali/Terraform-ELK.git
```
2. In the project root directory, create an SS key and name it **levelup_key**
```
ssh-keygen
``` 
3. Export your AWS Credentials
```
export AWS_ACCESS_KEY_ID=AKIAIOSFODNN7EXAMPLE
export AWS_SECRET_ACCESS_KEY=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
export AWS_DEFAULT_REGION=us-west-2
```
4. In the project root directory, initiate Terraform in order to install the declared provider in `provider.tf` file
```
terraform init
```
5. If you want to see your provisionning details, run the following command
```
terraform plan
```
6. Apply modifications
```
terraform apply
```