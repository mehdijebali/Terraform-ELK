<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.100.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_instance"></a> [instance](#module\_instance) | github.com/mehdijebali/terraform-modules//instance | v1.0.0 |
| <a name="module_ssm-role"></a> [ssm-role](#module\_ssm-role) | github.com/mehdijebali/terraform-modules//ssm-role | v1.0.0 |

## Resources

| Name | Type |
|------|------|
| [aws_eip.ip](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_security_group.allow_elk](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_ami.packer_ami](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |
| [aws_vpc.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_AVAILABILITY_ZONE"></a> [AVAILABILITY\_ZONE](#input\_AVAILABILITY\_ZONE) | AWS AZ where ELK instance is deployed | `string` | `"us-east-1a"` | no |
| <a name="input_AWS_REGION"></a> [AWS\_REGION](#input\_AWS\_REGION) | The region where resources are deployed | `string` | `"us-east-1"` | no |
| <a name="input_INSTANCE_NAME"></a> [INSTANCE\_NAME](#input\_INSTANCE\_NAME) | The name of EC2 instance | `string` | `"ELK-Server"` | no |
| <a name="input_INSTANCE_SUBNET_ID"></a> [INSTANCE\_SUBNET\_ID](#input\_INSTANCE\_SUBNET\_ID) | EC2 Instance Subnet ID | `string` | `"subnet-04b04399210978637"` | no |
| <a name="input_INSTANCE_TYPE"></a> [INSTANCE\_TYPE](#input\_INSTANCE\_TYPE) | AWS Instance type | `string` | `"m4.large"` | no |
| <a name="input_LD_NAME"></a> [LD\_NAME](#input\_LD\_NAME) | Linux distribution | `string` | `"centos"` | no |
| <a name="input_SG_DESCRIPTIONS"></a> [SG\_DESCRIPTIONS](#input\_SG\_DESCRIPTIONS) | SG descriptions | `list(any)` | <pre>[<br/>  "security group that allows ssh connection",<br/>  "Elasticsearch traffic"<br/>]</pre> | no |
| <a name="input_SG_NAMES"></a> [SG\_NAMES](#input\_SG\_NAMES) | Security Group names of ELK instance | `list(any)` | <pre>[<br/>  "allow-levelup-ssh",<br/>  "allow_elk"<br/>]</pre> | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->