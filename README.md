# terraform-aws-subnet

Terraform AWS Subnet
Terraform module to create public and private. 
Terraform Licence tfsec static-checks

Share on Facebook Share on LinkedIn Share on Twitter

We eat, drink, sleep and most importantly love DevOps. We are working towards strategies for standardizing architecture while ensuring security for the infrastructure. We are strong believer of the philosophy Bigger problems are always solved by breaking them into smaller manageable problems. Resonating with microservices architecture, it is considered best-practice to run database, cluster, storage in smaller connected yet manageable pieces within the infrastructure.

This module is basically combination of Terraform open source and includes automatation tests and examples. It also helps to create and improve your infrastructure with minimalistic code instead of maintaining the whole infrastructure code yourself.

We have fifty plus terraform modules. A few of them are comepleted and are available for open source usage while a few others are in progress.

Prerequisites
This module has a few dependencies:

Terraform 1.x.x
Go
github.com/stretchr/testify/assert
github.com/gruntwork-io/terratest/modules/terraform
Examples
IMPORTANT: Since the master branch used in source varies based on new modifications, we suggest that you use the release versions here.

Here are some examples of how you can use this module in your inventory structure:

Private Subnet
 module "subnets" {
  source      = "./../"
  name        = "subnet"
  environment = var.environment
  label_order = var.label_order

  availability_zones = ["ap-south-1a", "ap-south-1b"]
  vpc_id             = module.vpc.vpc_id
  type               = "private"
  igw_id             = module.vpc.igw_id
  cidr_block         = module.vpc.vpc_cidr_block
  ipv6_cidr_block    = module.vpc.ipv6_cidr_block
}

Public Subnet
 module "subnets" {
  source      = "./../"
  name        = "subnet"
  environment = var.environment
  label_order = var.label_order

  availability_zones = ["ap-south-1a", "ap-south-1b"]
  vpc_id             = module.vpc.vpc_id
  type               = "public"
  igw_id             = module.vpc.igw_id
  cidr_block         = module.vpc.vpc_cidr_block
  ipv6_cidr_block    = module.vpc.ipv6_cidr_block
}

Inputs
Name	Description	Type	Default	Required
assign_ipv6_address_on_creation	Specify true to indicate that network interfaces created in the specified subnet should be assigned an IPv6 address.	bool	false	no
attributes	Additional attributes (e.g. 1).	list(any)	[]	no
availability_zones	List of Availability Zones (e.g. ['ap-south-1a', 'ap-south-1b']).	list(string)	[]	no
az_ngw_count	Count of items in the az_ngw_ids map. Needs to be explicitly provided since Terraform currently can't use dynamic count on computed resources from different modules. hashicorp/terraform#10857.	number	0	no
az_ngw_ids	Only for private subnets. Map of AZ names to NAT Gateway IDs that are used as default routes when creating private subnets.	map(string)	{}	no
cidr_block	Base CIDR block which is divided into subnet CIDR blocks 	string	n/a	yes
delimiter	Delimiter to be used between organization, environment, name and attributes.	string	"-"	no
enable_acl	Set to false to prevent the module from creating any resources.	bool	true	no
enable_flow_log	Enable subnet_flow_log logs.	bool	false	no
enabled	Set to false to prevent the module from creating any resources.	bool	true	no
environment	Environment (e.g. prod, dev, staging).	string	""	no
igw_id	Internet Gateway ID that is used as a default route when creating public subnets (e.g. igw-9c26a123).	string	""	no
ipv4_private_cidrs	Subnet CIDR blocks.	list(any)	[]	no
ipv4_public_cidrs	Subnet CIDR blocks.	list(any)	[]	no
ipv6_cidr_block	Base CIDR block which is divided into subnet CIDR blocks.	string	n/a	yes
ipv6_cidrs	Subnet CIDR blocks (e.g. 2a05:d018:832:ca02::/64).	list(any)	[]	no
label_order	Label order, e.g. name,application.	list(any)	[]	no
managedby	ManagedBy, eg 'slovink'.	string	"hello@slovink.com"	no
map_public_ip_on_launch	Specify true to indicate that instances launched into the subnet should be assigned a public IP address.	bool	true	no
max_subnets	Maximum number of subnets that can be created. The variable is used for CIDR blocks calculation.	number	6	no
name	Name (e.g. app or cluster).	string	""	no
nat_gateway_enabled	Flag to enable/disable NAT Gateways creation in public subnets.	bool	false	no
private_network_acl_id	Network ACL ID that is added to the private subnets. If empty, a new ACL will be created.	string	""	no
public_network_acl_id	Network ACL ID that is added to the public subnets. If empty, a new ACL will be created.	string	""	no
public_subnet_ids	A list of public subnet ids.	list(string)	[]	no
repository	Terraform current module repo	string	"https://github.com/slovink/terraform-aws-subnet"	no
s3_bucket_arn	S3 ARN for vpc logs.	string	""	no
single_nat_gateway	n/a	bool	false	no
tags	Additional tags (e.g. map(BusinessUnit,XYZ).	map(any)	{}	no
traffic_type	Type of traffic to capture. Valid values: ACCEPT,REJECT, ALL.	string	"ALL"	no
type	Type of subnets to create (private or public).	string	""	no
vpc_id	VPC ID.	string	n/a	yes
Outputs
Name	Description
private_acl	The ID of the network ACL.
private_route_tables_id	The ID of the routing table.
private_subnet_cidrs	CIDR blocks of the created private subnets.
private_subnet_cidrs_ipv6	CIDR blocks of the created private subnets.
private_subnet_id	The ID of the private subnet.
private_tags	A mapping of private tags to assign to the resource.
public_acl	The ID of the network ACL.
public_route_tables_id	The ID of the routing table.
public_subnet_cidrs	CIDR blocks of the created public subnets.
public_subnet_cidrs_ipv6	CIDR blocks of the created public subnets.
public_subnet_id	The ID of the subnet.
public_tags	A mapping of public tags to assign to the resource.
Testing
In this module testing is performed with terratest and it creates a small piece of infrastructure, matches the output like ARN, ID and Tags name etc and destroy infrastructure in your AWS account. This testing is written in GO, so you need a GO environment in your system.

You need to run the following command in the testing folder:

  go test -run Test
Feedback
If you come accross a bug or have any feedback, please log it in our issue tracker, or feel free to drop us an email at hello@slovink.com.

If you have found it worth your time, go ahead and give us a ★ on our GitHub!

About us
At slovink, we offer expert guidance, implementation support and services to help organisations accelerate their journey to the cloud. Our services include docker and container orchestration, cloud migration and adoption, infrastructure automation, application modernisation and remediation, and performance engineering.

We are The Cloud Experts!


