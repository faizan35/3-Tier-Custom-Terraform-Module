# 3-Tier-Custom-Terraform-Module

## Requirements

| Name                                                   | Version |
| ------------------------------------------------------ | ------- |
| <a name="requirement_aws"></a> [aws](#requirement_aws) | 5.38.0  |

## Providers

No providers.

## Modules

| Name                                                                    | Source                 | Version |
| ----------------------------------------------------------------------- | ---------------------- | ------- |
| <a name="module_app_lb"></a> [app_lb](#module_app_lb)                   | ./modules/app-lb       | n/a     |
| <a name="module_ec2-instance"></a> [ec2-instance](#module_ec2-instance) | ./modules/ec2-instance | n/a     |
| <a name="module_rds"></a> [rds](#module_rds)                            | ./modules/rds          | n/a     |
| <a name="module_sg"></a> [sg](#module_sg)                               | ./modules/sg           | n/a     |
| <a name="module_vpc"></a> [vpc](#module_vpc)                            | ./modules/vpc          | n/a     |

## Resources

No resources.

## Inputs

| Name                                                                                    | Description           | Type     | Default | Required |
| --------------------------------------------------------------------------------------- | --------------------- | -------- | ------- | :------: |
| <a name="input_ami"></a> [ami](#input_ami)                                              | AMI for EC2           | `string` | n/a     |   yes    |
| <a name="input_cidr_vpc"></a> [cidr_vpc](#input_cidr_vpc)                               | CIDR for VPC.         | `string` | n/a     |   yes    |
| <a name="input_count_of_instance"></a> [count_of_instance](#input_count_of_instance)    | number of instance    | `number` | n/a     |   yes    |
| <a name="input_instance_type"></a> [instance_type](#input_instance_type)                | Type of Instance      | `string` | n/a     |   yes    |
| <a name="input_private_cidr_vpc"></a> [private_cidr_vpc](#input_private_cidr_vpc)       | Private CIDR for VPC. | `string` | n/a     |   yes    |
| <a name="input_private_cidr_vpc-2"></a> [private_cidr_vpc-2](#input_private_cidr_vpc-2) | Private CIDR for VPC. | `string` | n/a     |   yes    |
| <a name="input_public_cidr_vpc"></a> [public_cidr_vpc](#input_public_cidr_vpc)          | public CIDR for VPC.  | `string` | n/a     |   yes    |

## Outputs

| Name                                                                                         | Description                    |
| -------------------------------------------------------------------------------------------- | ------------------------------ |
| <a name="output_SG_ID"></a> [SG_ID](#output_SG_ID)                                           | n/a                            |
| <a name="output_instance-ID"></a> [instance-ID](#output_instance-ID)                         | ############# EC2 ############ |
| <a name="output_internet_gateway"></a> [internet_gateway](#output_internet_gateway)          | n/a                            |
| <a name="output_private_subnet_id"></a> [private_subnet_id](#output_private_subnet_id)       | n/a                            |
| <a name="output_private_subnet_id-2"></a> [private_subnet_id-2](#output_private_subnet_id-2) | n/a                            |
| <a name="output_public_subnet_id"></a> [public_subnet_id](#output_public_subnet_id)          | n/a                            |
| <a name="output_vpc_id"></a> [vpc_id](#output_vpc_id)                                        | ############ VPC ###########   |
