
<p align="center"> <img src="https://user-images.githubusercontent.com/50652676/62349836-882fef80-b51e-11e9-99e3-7b974309c7e3.png" width="100" height="100"></p>


<h1 align="center">
    Terraform AWS subnet
</h1>

<p align="center" style="font-size: 1.2rem;">
    Terraform module to create subnet resource on AWS.
     </p>

<p align="center">

<a href="https://www.terraform.io">
  <img src="https://img.shields.io/badge/Terraform-v1.7.0-green" alt="Terraform">
</a>
<a href="https://github.com/slovink/terraform-aws-subnet/blob/main/LICENSE">
  <img src="https://img.shields.io/badge/License-APACHE-blue.svg" alt="Licence">
</a>



</p>
<p align="center">

<a href='https://www.facebook.com/Slovink.in=https://github.com/slovink/terraform-subnet'>
  <img title="Share on Facebook" src="https://user-images.githubusercontent.com/50652676/62817743-4f64cb80-bb59-11e9-90c7-b057252ded50.png" />
</a>
<a href='https://www.linkedin.com/company/101534993/admin/feed/posts/=https://github.com/slovink/terraform-subnet'>
  <img title="Share on LinkedIn" src="https://user-images.githubusercontent.com/50652676/62817742-4e339e80-bb59-11e9-87b9-a1f68cae1049.png" />
</a>




## Prerequisites

This module has a few dependencies:

- [Terraform 1.7.0](https://learn.hashicorp.com/terraform/getting-started/install.html)
- [Go](https://golang.org/doc/install)







## Examples


**IMPORTANT:** Since the `master` branch used in `source` varies based on new modifications, we suggest that you use the release versions [here](https://github.com/slovink/terraform-aws-subnet/releases).


### Example: database-subnet

  ```hcl
module "subnet" {
  source             = "https://github.com/slovink/terraform-aws-subnet.git?ref=v1.0.0"
  name               = "app"
  environment        = "test"
  availability_zones = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
  vpc_id             = module.vpc.id
  cidr_block         = "10.0.192.0/18"
  type               = "database"
}
```

# Example: private-subnet
```hcl
module "private-subnets" {
  source              = "https://github.com/slovink/terraform-aws-subnet.git?ref=v1.0.0"
  name                = "app"
  environment         = "test"
  nat_gateway_enabled = true
  availability_zones  = ["eu-west-1a"]
  vpc_id              = module.vpc.id
  type                = "private"
  cidr_block          = module.vpc.vpc_cidr_block
  ipv6_cidr_block     = module.vpc.ipv6_cidr_block
  ipv4_private_cidrs  = ["10.0.30.0/24"]
  public_subnet_ids   = module.private-subnets.private_subnet_id
}
 ```
# Example: public-private
```hcl
module "subnets" {
  source                                         = "https://github.com/slovink/terraform-aws-subnet.git?ref=v1.0.0"
  name                                           = "app"
  environment                                    = "test"
  nat_gateway_enabled                            = true
  availability_zones                             = ["eu-west-1a", "eu-west-1b"]
  vpc_id                                         = module.vpc.id
  type                                           = "public-private"
  igw_id                                         = module.vpc.igw_id
  cidr_block                                     = module.vpc.vpc_cidr_block
  ipv6_cidr_block                                = module.vpc.ipv6_cidr_block
  public_subnet_assign_ipv6_address_on_creation  = true
  enable_ipv6                                    = true
  private_subnet_assign_ipv6_address_on_creation = true
}
```

# Example: public-private-database-subnet
```hcl

module "subnet" {
  source              = "https://github.com/slovink/terraform-aws-subnet.git?ref=v1.0.0"
  name                = "app"
  environment         = "test"
  availability_zones  = ["eu-west-1a", "eu-west-1b", ]
  vpc_id              = module.vpc.id
  type                = "public-private-database"
  nat_gateway_enabled = true
  single_nat_gateway  = true
  cidr_block          = module.vpc.vpc_cidr_block
  ipv6_cidr_block     = module.vpc.ipv6_cidr_block
  igw_id              = module.vpc.igw_id
}
```

# Example:  public-private-subnet-single-nat-gateway
```hcl

module "subnets" {
  source              = "https://github.com/slovink/terraform-aws-subnet.git?ref=v1.0.0"
  name                = "app"
  environment         = "test"
  nat_gateway_enabled = true
  single_nat_gateway  = true
  availability_zones  = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
  vpc_id              = module.vpc.id
  type                = "public-private"
  igw_id              = module.vpc.igw_id
  cidr_block          = module.vpc.vpc_cidr_block
  ipv6_cidr_block     = module.vpc.ipv6_cidr_block
  enable_ipv6         = false
}
```
# Example:   public-subnet
```hcl

module "subnet" {
  source             = "https://github.com/slovink/terraform-aws-subnet.git?ref=v1.0.0"
  name               = "app"
  environment        = "test"
  availability_zones = ["eu-west-1a", "eu-west-1b", ]
  type               = "public"
  vpc_id             = module.vpc.id
  cidr_block         = module.vpc.vpc_cidr_block
  igw_id             = module.vpc.igw_id
  enable_ipv6        = false
}
  ```



## Feedback
If you come accross a bug or have any feedback, please log it in our [issue tracker](https://github.com/slovink/terraform-aws-subnet/issues), or feel free to drop us an email at [concat@slovink.com](concat@slovink.com).

If you have found it worth your time, go ahead and give us a ★ on [our GitHub](https://github.com/slovink/terraform-aws-subnet)!


## About us
At https://slovink.com/ we offer expert guidance, implementation support and services to help organisations accelerate their journey to the slovi. Our
services include docker and container orchestration, slov migration and adoption, infrastructure automation, application modernisation and
remediation, and performance engineering.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.6.4, < 1.7.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.32.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.32.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_database-labels"></a> [database-labels](#module\_database-labels) | git@github.com:slovink/terraform-aws-labels.git | 1.0.0 |
| <a name="module_private-labels"></a> [private-labels](#module\_private-labels) | git@github.com:slovink/terraform-aws-labels.git | 1.0.0 |
| <a name="module_public-labels"></a> [public-labels](#module\_public-labels) | git@github.com:slovink/terraform-aws-labels.git | 1.0.0 |

## Resources

| Name | Type |
|------|------|
| [aws_eip.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_flow_log.database_subnet_flow_log](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/flow_log) | resource |
| [aws_flow_log.private_subnet_flow_log](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/flow_log) | resource |
| [aws_flow_log.public_subnet_flow_log](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/flow_log) | resource |
| [aws_nat_gateway.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway) | resource |
| [aws_network_acl.database](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/network_acl) | resource |
| [aws_network_acl.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/network_acl) | resource |
| [aws_network_acl.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/network_acl) | resource |
| [aws_network_acl_rule.database_inbound](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/network_acl_rule) | resource |
| [aws_network_acl_rule.database_outbound](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/network_acl_rule) | resource |
| [aws_network_acl_rule.private_inbound](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/network_acl_rule) | resource |
| [aws_network_acl_rule.private_outbound](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/network_acl_rule) | resource |
| [aws_network_acl_rule.public_inbound](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/network_acl_rule) | resource |
| [aws_network_acl_rule.public_outbound](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/network_acl_rule) | resource |
| [aws_route.nat_gateway](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_route.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_route.public_ipv6](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_route_table.database](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.private-rt](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.public-rt](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table_association.database](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_subnet.database](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.private_sub](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.public_sub](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_attributes"></a> [attributes](#input\_attributes) | Additional attributes (e.g. `1`). | `list(any)` | `[]` | no |
| <a name="input_availability_zones"></a> [availability\_zones](#input\_availability\_zones) | List of Availability Zones (e.g. `['us-east-1a', 'us-east-1b', 'us-east-1c']`). | `list(string)` | `[]` | no |
| <a name="input_cidr_block"></a> [cidr\_block](#input\_cidr\_block) | Base CIDR block which is divided into subnet CIDR blocks (e.g. `10.0.0.0/16`). | `string` | `null` | no |
| <a name="input_database_inbound_acl_rules"></a> [database\_inbound\_acl\_rules](#input\_database\_inbound\_acl\_rules) | database subnets inbound network ACLs | `list(map(string))` | <pre>[<br>  {<br>    "cidr_block": "0.0.0.0/0",<br>    "from_port": 0,<br>    "protocol": "-1",<br>    "rule_action": "allow",<br>    "rule_number": 100,<br>    "to_port": 0<br>  }<br>]</pre> | no |
| <a name="input_database_ipv6_cidrs"></a> [database\_ipv6\_cidrs](#input\_database\_ipv6\_cidrs) | database Subnet CIDR blocks (e.g. `2a05:d018:832:ca02::/64`). | `list(any)` | `[]` | no |
| <a name="input_database_outbound_acl_rules"></a> [database\_outbound\_acl\_rules](#input\_database\_outbound\_acl\_rules) | database subnets outbound network ACLs | `list(map(string))` | <pre>[<br>  {<br>    "cidr_block": "0.0.0.0/0",<br>    "from_port": 0,<br>    "protocol": "-1",<br>    "rule_action": "allow",<br>    "rule_number": 100,<br>    "to_port": 0<br>  }<br>]</pre> | no |
| <a name="input_database_subnet_assign_ipv6_address_on_creation"></a> [database\_subnet\_assign\_ipv6\_address\_on\_creation](#input\_database\_subnet\_assign\_ipv6\_address\_on\_creation) | Specify true to indicate that network interfaces created in the specified subnet should be assigned an IPv6 address. | `bool` | `false` | no |
| <a name="input_database_subnet_enable_dns64"></a> [database\_subnet\_enable\_dns64](#input\_database\_subnet\_enable\_dns64) | Indicates whether DNS queries made to the Amazon-provided DNS Resolver in this subnet should return synthetic IPv6 addresses for IPv4-only destinations. Default: `true` | `bool` | `false` | no |
| <a name="input_database_subnet_enable_resource_name_dns_a_record_on_launch"></a> [database\_subnet\_enable\_resource\_name\_dns\_a\_record\_on\_launch](#input\_database\_subnet\_enable\_resource\_name\_dns\_a\_record\_on\_launch) | Indicates whether to respond to DNS queries for instance hostnames with DNS A records. Default: `false` | `bool` | `false` | no |
| <a name="input_database_subnet_enable_resource_name_dns_aaaa_record_on_launch"></a> [database\_subnet\_enable\_resource\_name\_dns\_aaaa\_record\_on\_launch](#input\_database\_subnet\_enable\_resource\_name\_dns\_aaaa\_record\_on\_launch) | Indicates whether to respond to DNS queries for instance hostnames with DNS AAAA records. Default: `true` | `bool` | `false` | no |
| <a name="input_database_subnet_ipv6_native"></a> [database\_subnet\_ipv6\_native](#input\_database\_subnet\_ipv6\_native) | Indicates whether to create an IPv6-only database subnet. Default: `false` | `bool` | `false` | no |
| <a name="input_database_subnet_private_dns_hostname_type_on_launch"></a> [database\_subnet\_private\_dns\_hostname\_type\_on\_launch](#input\_database\_subnet\_private\_dns\_hostname\_type\_on\_launch) | The type of hostnames to assign to instances in the subnet at launch. For IPv6-only subnets, an instance DNS name must be based on the instance ID. For dual-stack and IPv4-only subnets, you can specify whether DNS names use the instance IPv4 address or the instance ID. Valid values: `ip-name`, `resource-name` | `string` | `null` | no |
| <a name="input_delimiter"></a> [delimiter](#input\_delimiter) | Delimiter to be used between `organization`, `environment`, `name` and `attributes`. | `string` | `"-"` | no |
| <a name="input_enable"></a> [enable](#input\_enable) | Set to false to prevent the module from creating any resources. | `bool` | `true` | no |
| <a name="input_enable_database_acl"></a> [enable\_database\_acl](#input\_enable\_database\_acl) | Set to false to prevent the module from creating any resources. | `bool` | `true` | no |
| <a name="input_enable_flow_log"></a> [enable\_flow\_log](#input\_enable\_flow\_log) | Enable subnet\_flow\_log logs. | `bool` | `false` | no |
| <a name="input_enable_ipv6"></a> [enable\_ipv6](#input\_enable\_ipv6) | Requests an Amazon-provided IPv6 CIDR block with a /56 prefix length for the VPC. You cannot specify the range of IP addresses, or the size of the CIDR block | `bool` | `false` | no |
| <a name="input_enable_private_acl"></a> [enable\_private\_acl](#input\_enable\_private\_acl) | Set to false to prevent the module from creating any resources. | `bool` | `true` | no |
| <a name="input_enable_public_acl"></a> [enable\_public\_acl](#input\_enable\_public\_acl) | Set to false to prevent the module from creating any resources. | `bool` | `true` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment (e.g. `prod`, `dev`, `staging`). | `string` | `""` | no |
| <a name="input_extra_database_tags"></a> [extra\_database\_tags](#input\_extra\_database\_tags) | Additional private subnet tags. | `map(any)` | `{}` | no |
| <a name="input_extra_private_tags"></a> [extra\_private\_tags](#input\_extra\_private\_tags) | Additional private subnet tags. | `map(any)` | `{}` | no |
| <a name="input_extra_public_tags"></a> [extra\_public\_tags](#input\_extra\_public\_tags) | Additional tags (e.g. map(`BusinessUnit`,`XYZ`). | `map(any)` | `{}` | no |
| <a name="input_flow_log_destination_arn"></a> [flow\_log\_destination\_arn](#input\_flow\_log\_destination\_arn) | ARN of resource in which flow log will be sent. | `string` | `null` | no |
| <a name="input_flow_log_destination_type"></a> [flow\_log\_destination\_type](#input\_flow\_log\_destination\_type) | Type of flow log destination. Can be s3 or cloud-watch-logs | `string` | `"cloud-watch-logs"` | no |
| <a name="input_flow_log_file_format"></a> [flow\_log\_file\_format](#input\_flow\_log\_file\_format) | (Optional) The format for the flow log. Valid values: `plain-text`, `parquet` | `string` | `null` | no |
| <a name="input_flow_log_hive_compatible_partitions"></a> [flow\_log\_hive\_compatible\_partitions](#input\_flow\_log\_hive\_compatible\_partitions) | (Optional) Indicates whether to use Hive-compatible prefixes for flow logs stored in Amazon S3 | `bool` | `false` | no |
| <a name="input_flow_log_iam_role_arn"></a> [flow\_log\_iam\_role\_arn](#input\_flow\_log\_iam\_role\_arn) | The ARN for the IAM role that's used to post flow logs to a CloudWatch Logs log group. When flow\_log\_destination\_arn is set to ARN of Cloudwatch Logs, this argument needs to be provided | `string` | `null` | no |
| <a name="input_flow_log_log_format"></a> [flow\_log\_log\_format](#input\_flow\_log\_log\_format) | The fields to include in the flow log record, in the order in which they should appear | `string` | `null` | no |
| <a name="input_flow_log_max_aggregation_interval"></a> [flow\_log\_max\_aggregation\_interval](#input\_flow\_log\_max\_aggregation\_interval) | The maximum interval of time during which a flow of packets is captured and aggregated into a flow log record. Valid Values: `60` seconds or `600` seconds | `number` | `600` | no |
| <a name="input_flow_log_per_hour_partition"></a> [flow\_log\_per\_hour\_partition](#input\_flow\_log\_per\_hour\_partition) | (Optional) Indicates whether to partition the flow log per hour. This reduces the cost and response time for queries | `bool` | `false` | no |
| <a name="input_flow_log_traffic_type"></a> [flow\_log\_traffic\_type](#input\_flow\_log\_traffic\_type) | Type of traffic to capture. Valid values: ACCEPT,REJECT, ALL. | `string` | `"ALL"` | no |
| <a name="input_igw_id"></a> [igw\_id](#input\_igw\_id) | Internet Gateway ID that is used as a default route when creating public subnets (e.g. `igw-9c26a123`). | `string` | `""` | no |
| <a name="input_ipv4_database_cidrs"></a> [ipv4\_database\_cidrs](#input\_ipv4\_database\_cidrs) | Subnet CIDR blocks (e.g. `10.0.0.0/16`). | `list(any)` | `[]` | no |
| <a name="input_ipv4_private_cidrs"></a> [ipv4\_private\_cidrs](#input\_ipv4\_private\_cidrs) | Subnet CIDR blocks (e.g. `10.0.0.0/16`). | `list(any)` | `[]` | no |
| <a name="input_ipv4_public_cidrs"></a> [ipv4\_public\_cidrs](#input\_ipv4\_public\_cidrs) | Subnet CIDR blocks (e.g. `10.0.0.0/16`). | `list(any)` | `[]` | no |
| <a name="input_ipv6_cidr_block"></a> [ipv6\_cidr\_block](#input\_ipv6\_cidr\_block) | Base CIDR block which is divided into subnet CIDR blocks (e.g. `10.0.0.0/16`). | `string` | `null` | no |
| <a name="input_label_order"></a> [label\_order](#input\_label\_order) | Label order, e.g. `name`,`Environment`. | `list(any)` | <pre>[<br>  "name",<br>  "environment"<br>]</pre> | no |
| <a name="input_managedby"></a> [managedby](#input\_managedby) | ManagedBy, eg 'slovink'. | `string` | `"slovink"` | no |
| <a name="input_map_database_ip_on_launch"></a> [map\_database\_ip\_on\_launch](#input\_map\_database\_ip\_on\_launch) | Specify true to indicate that instances launched into the database subnet should be assigned a public IP address. | `bool` | `false` | no |
| <a name="input_map_public_ip_on_launch"></a> [map\_public\_ip\_on\_launch](#input\_map\_public\_ip\_on\_launch) | Specify true to indicate that instances launched into the public subnet should be assigned a public IP address. | `bool` | `false` | no |
| <a name="input_name"></a> [name](#input\_name) | Name  (e.g. `prod-subnet` or `subnet`). | `string` | `""` | no |
| <a name="input_nat_gateway_destination_cidr_block"></a> [nat\_gateway\_destination\_cidr\_block](#input\_nat\_gateway\_destination\_cidr\_block) | Used to pass a custom destination route for private NAT Gateway. If not specified, the default 0.0.0.0/0 is used as a destination route | `string` | `"0.0.0.0/0"` | no |
| <a name="input_nat_gateway_enabled"></a> [nat\_gateway\_enabled](#input\_nat\_gateway\_enabled) | Flag to enable/disable NAT Gateways creation in public subnets. | `bool` | `false` | no |
| <a name="input_private_inbound_acl_rules"></a> [private\_inbound\_acl\_rules](#input\_private\_inbound\_acl\_rules) | Private subnets inbound network ACLs | `list(map(string))` | <pre>[<br>  {<br>    "cidr_block": "0.0.0.0/0",<br>    "from_port": 0,<br>    "protocol": "-1",<br>    "rule_action": "allow",<br>    "rule_number": 100,<br>    "to_port": 0<br>  }<br>]</pre> | no |
| <a name="input_private_ipv6_cidrs"></a> [private\_ipv6\_cidrs](#input\_private\_ipv6\_cidrs) | Private Subnet CIDR blocks (e.g. `2a05:d018:832:ca02::/64`). | `list(any)` | `[]` | no |
| <a name="input_private_outbound_acl_rules"></a> [private\_outbound\_acl\_rules](#input\_private\_outbound\_acl\_rules) | Private subnets outbound network ACLs | `list(map(string))` | <pre>[<br>  {<br>    "cidr_block": "0.0.0.0/0",<br>    "from_port": 0,<br>    "protocol": "-1",<br>    "rule_action": "allow",<br>    "rule_number": 100,<br>    "to_port": 0<br>  }<br>]</pre> | no |
| <a name="input_private_subnet_assign_ipv6_address_on_creation"></a> [private\_subnet\_assign\_ipv6\_address\_on\_creation](#input\_private\_subnet\_assign\_ipv6\_address\_on\_creation) | Specify true to indicate that network interfaces created in the specified subnet should be assigned an IPv6 address. | `bool` | `false` | no |
| <a name="input_private_subnet_enable_dns64"></a> [private\_subnet\_enable\_dns64](#input\_private\_subnet\_enable\_dns64) | Indicates whether DNS queries made to the Amazon-provided DNS Resolver in this subnet should return synthetic IPv6 addresses for IPv4-only destinations. Default: `true` | `bool` | `false` | no |
| <a name="input_private_subnet_enable_resource_name_dns_a_record_on_launch"></a> [private\_subnet\_enable\_resource\_name\_dns\_a\_record\_on\_launch](#input\_private\_subnet\_enable\_resource\_name\_dns\_a\_record\_on\_launch) | Indicates whether to respond to DNS queries for instance hostnames with DNS A records. Default: `false` | `bool` | `false` | no |
| <a name="input_private_subnet_enable_resource_name_dns_aaaa_record_on_launch"></a> [private\_subnet\_enable\_resource\_name\_dns\_aaaa\_record\_on\_launch](#input\_private\_subnet\_enable\_resource\_name\_dns\_aaaa\_record\_on\_launch) | Indicates whether to respond to DNS queries for instance hostnames with DNS AAAA records. Default: `true` | `bool` | `false` | no |
| <a name="input_private_subnet_ipv6_native"></a> [private\_subnet\_ipv6\_native](#input\_private\_subnet\_ipv6\_native) | Indicates whether to create an IPv6-only private subnet. Default: `false` | `bool` | `false` | no |
| <a name="input_private_subnet_private_dns_hostname_type_on_launch"></a> [private\_subnet\_private\_dns\_hostname\_type\_on\_launch](#input\_private\_subnet\_private\_dns\_hostname\_type\_on\_launch) | The type of hostnames to assign to instances in the subnet at launch. For IPv6-only subnets, an instance DNS name must be based on the instance ID. For dual-stack and IPv4-only subnets, you can specify whether DNS names use the instance IPv4 address or the instance ID. Valid values: `ip-name`, `resource-name` | `string` | `null` | no |
| <a name="input_public_inbound_acl_rules"></a> [public\_inbound\_acl\_rules](#input\_public\_inbound\_acl\_rules) | Public subnets inbound network ACLs | `list(map(string))` | <pre>[<br>  {<br>    "cidr_block": "0.0.0.0/0",<br>    "from_port": 0,<br>    "protocol": "-1",<br>    "rule_action": "allow",<br>    "rule_number": 100,<br>    "to_port": 0<br>  }<br>]</pre> | no |
| <a name="input_public_ipv6_cidrs"></a> [public\_ipv6\_cidrs](#input\_public\_ipv6\_cidrs) | Public Subnet CIDR blocks (e.g. `2a05:d018:832:ca02::/64`). | `list(any)` | `[]` | no |
| <a name="input_public_outbound_acl_rules"></a> [public\_outbound\_acl\_rules](#input\_public\_outbound\_acl\_rules) | Public subnets outbound network ACLs | `list(map(string))` | <pre>[<br>  {<br>    "cidr_block": "0.0.0.0/0",<br>    "from_port": 0,<br>    "protocol": "-1",<br>    "rule_action": "allow",<br>    "rule_number": 100,<br>    "to_port": 0<br>  }<br>]</pre> | no |
| <a name="input_public_rt_ipv4_destination_cidr"></a> [public\_rt\_ipv4\_destination\_cidr](#input\_public\_rt\_ipv4\_destination\_cidr) | The destination ipv4 CIDR block. | `string` | `"0.0.0.0/0"` | no |
| <a name="input_public_rt_ipv6_destination_cidr"></a> [public\_rt\_ipv6\_destination\_cidr](#input\_public\_rt\_ipv6\_destination\_cidr) | The destination ipv6 CIDR block. | `string` | `"::/0"` | no |
| <a name="input_public_subnet_assign_ipv6_address_on_creation"></a> [public\_subnet\_assign\_ipv6\_address\_on\_creation](#input\_public\_subnet\_assign\_ipv6\_address\_on\_creation) | Specify true to indicate that network interfaces created in the specified subnet should be assigned an IPv6 address. | `bool` | `false` | no |
| <a name="input_public_subnet_enable_dns64"></a> [public\_subnet\_enable\_dns64](#input\_public\_subnet\_enable\_dns64) | Indicates whether DNS queries made to the Amazon-provided DNS Resolver in this subnet should return synthetic IPv6 addresses for IPv4-only destinations. Default: `true` | `bool` | `false` | no |
| <a name="input_public_subnet_enable_resource_name_dns_a_record_on_launch"></a> [public\_subnet\_enable\_resource\_name\_dns\_a\_record\_on\_launch](#input\_public\_subnet\_enable\_resource\_name\_dns\_a\_record\_on\_launch) | Indicates whether to respond to DNS queries for instance hostnames with DNS A records. Default: `false` | `bool` | `false` | no |
| <a name="input_public_subnet_enable_resource_name_dns_aaaa_record_on_launch"></a> [public\_subnet\_enable\_resource\_name\_dns\_aaaa\_record\_on\_launch](#input\_public\_subnet\_enable\_resource\_name\_dns\_aaaa\_record\_on\_launch) | Indicates whether to respond to DNS queries for instance hostnames with DNS AAAA records. Default: `true` | `bool` | `false` | no |
| <a name="input_public_subnet_ids"></a> [public\_subnet\_ids](#input\_public\_subnet\_ids) | A list of public subnet ids. | `list(string)` | `[]` | no |
| <a name="input_public_subnet_ipv6_native"></a> [public\_subnet\_ipv6\_native](#input\_public\_subnet\_ipv6\_native) | Indicates whether to create an IPv6-only public subnet. Default: `false` | `bool` | `false` | no |
| <a name="input_public_subnet_private_dns_hostname_type_on_launch"></a> [public\_subnet\_private\_dns\_hostname\_type\_on\_launch](#input\_public\_subnet\_private\_dns\_hostname\_type\_on\_launch) | The type of hostnames to assign to instances in the subnet at launch. For IPv6-only subnets, an instance DNS name must be based on the instance ID. For dual-stack and IPv4-only subnets, you can specify whether DNS names use the instance IPv4 address or the instance ID. Valid values: `ip-name`, `resource-name` | `string` | `null` | no |
| <a name="input_repository"></a> [repository](#input\_repository) | Terraform current module repo | `string` | `"https://github.com/slovink/terraform-aws-subnet.git"` | no |
| <a name="input_single_nat_gateway"></a> [single\_nat\_gateway](#input\_single\_nat\_gateway) | Enable for only single NAT Gateway in one Availability Zone | `bool` | `false` | no |
| <a name="input_type"></a> [type](#input\_type) | Type of subnets to create (`private` or `public`). | `string` | `""` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC ID. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_database_acl"></a> [database\_acl](#output\_database\_acl) | The ID of the network ACL. |
| <a name="output_database_route_tables_id"></a> [database\_route\_tables\_id](#output\_database\_route\_tables\_id) | The ID of the routing table. |
| <a name="output_database_subnet_cidrs"></a> [database\_subnet\_cidrs](#output\_database\_subnet\_cidrs) | CIDR blocks of the created database subnets. |
| <a name="output_database_subnet_cidrs_ipv6"></a> [database\_subnet\_cidrs\_ipv6](#output\_database\_subnet\_cidrs\_ipv6) | CIDR blocks of the created database subnets. |
| <a name="output_database_subnet_id"></a> [database\_subnet\_id](#output\_database\_subnet\_id) | The ID of the subnet. |
| <a name="output_database_tags"></a> [database\_tags](#output\_database\_tags) | A mapping of public tags to assign to the resource. |
| <a name="output_private_acl"></a> [private\_acl](#output\_private\_acl) | The ID of the network ACL. |
| <a name="output_private_route_tables_id"></a> [private\_route\_tables\_id](#output\_private\_route\_tables\_id) | The ID of the routing table. |
| <a name="output_private_subnet_cidrs"></a> [private\_subnet\_cidrs](#output\_private\_subnet\_cidrs) | CIDR blocks of the created private subnets. |
| <a name="output_private_subnet_cidrs_ipv6"></a> [private\_subnet\_cidrs\_ipv6](#output\_private\_subnet\_cidrs\_ipv6) | CIDR blocks of the created private subnets. |
| <a name="output_private_subnet_id"></a> [private\_subnet\_id](#output\_private\_subnet\_id) | The ID of the private subnet. |
| <a name="output_private_tags"></a> [private\_tags](#output\_private\_tags) | A mapping of private tags to assign to the resource. |
| <a name="output_public_acl"></a> [public\_acl](#output\_public\_acl) | The ID of the network ACL. |
| <a name="output_public_route_tables_id"></a> [public\_route\_tables\_id](#output\_public\_route\_tables\_id) | The ID of the routing table. |
| <a name="output_public_subnet_cidrs"></a> [public\_subnet\_cidrs](#output\_public\_subnet\_cidrs) | CIDR blocks of the created public subnets. |
| <a name="output_public_subnet_cidrs_ipv6"></a> [public\_subnet\_cidrs\_ipv6](#output\_public\_subnet\_cidrs\_ipv6) | CIDR blocks of the created public subnets. |
| <a name="output_public_subnet_id"></a> [public\_subnet\_id](#output\_public\_subnet\_id) | The ID of the subnet. |
| <a name="output_public_tags"></a> [public\_tags](#output\_public\_tags) | A mapping of public tags to assign to the resource. |
<!-- END_TF_DOCS -->