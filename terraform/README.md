<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.84.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_instance"></a> [instance](#module\_instance) | ./modules/instance | n/a |

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
| <a name="input_AVAILABILITY_ZONE"></a> [AVAILABILITY\_ZONE](#input\_AVAILABILITY\_ZONE) | n/a | `string` | `"us-east-1a"` | no |
| <a name="input_AWS_REGION"></a> [AWS\_REGION](#input\_AWS\_REGION) | n/a | `string` | `"us-east-1"` | no |
| <a name="input_INSTANCE_NAME"></a> [INSTANCE\_NAME](#input\_INSTANCE\_NAME) | n/a | `string` | `"ELK Server"` | no |
| <a name="input_INSTANCE_TYPE"></a> [INSTANCE\_TYPE](#input\_INSTANCE\_TYPE) | n/a | `string` | `"m4.large"` | no |
| <a name="input_INSTANCE_USERNAME"></a> [INSTANCE\_USERNAME](#input\_INSTANCE\_USERNAME) | n/a | `string` | `"ubuntu"` | no |
| <a name="input_KEY_NAME"></a> [KEY\_NAME](#input\_KEY\_NAME) | n/a | `string` | `"tf-ssh-key"` | no |
| <a name="input_LD_NAME"></a> [LD\_NAME](#input\_LD\_NAME) | n/a | `string` | `"centos"` | no |
| <a name="input_PATH_TO_PRIVATE_KEY"></a> [PATH\_TO\_PRIVATE\_KEY](#input\_PATH\_TO\_PRIVATE\_KEY) | n/a | `string` | `"levelup_key"` | no |
| <a name="input_PATH_TO_PUBLIC_KEY"></a> [PATH\_TO\_PUBLIC\_KEY](#input\_PATH\_TO\_PUBLIC\_KEY) | n/a | `string` | `"levelup_key.pub"` | no |
| <a name="input_SG_DESCRIPTIONS"></a> [SG\_DESCRIPTIONS](#input\_SG\_DESCRIPTIONS) | n/a | `list(any)` | <pre>[<br/>  "security group that allows ssh connection",<br/>  "Elasticsearch traffic"<br/>]</pre> | no |
| <a name="input_SG_NAMES"></a> [SG\_NAMES](#input\_SG\_NAMES) | n/a | `list(any)` | <pre>[<br/>  "allow-levelup-ssh",<br/>  "allow_elk"<br/>]</pre> | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->