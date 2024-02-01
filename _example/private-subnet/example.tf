provider "aws" {
  region = "ap-southeast-2"
}

##-----------------------------------------------------------------------------
## Vpc Module call.
##-----------------------------------------------------------------------------
module "vpc" {
  source      = "git@github.com:slovink/terraform-aws-vpc.git?ref=vinod"
  name        = "app"
  environment = "test"
  cidr_block  = "10.0.0.0/16"

}

##-----------------------------------------------------------------------------
## Subnet Module call.
##-----------------------------------------------------------------------------
module "private-subnets" {
  source              = "./../../"
  name                = "app"
  environment         = "test"
  nat_gateway_enabled = true
  availability_zones  = ["ap-southeast-2a"]
  vpc_id              = module.vpc.id
  type                = "private"
  cidr_block          = module.vpc.vpc_cidr_block
  ipv6_cidr_block     = module.vpc.ipv6_cidr_block
  ipv4_private_cidrs  = ["10.0.30.0/24"]
  public_subnet_ids   = module.private-subnets.private_subnet_id
}
