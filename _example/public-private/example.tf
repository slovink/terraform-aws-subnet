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

module "subnets" {
  source                                         = "./../../"
  name                                           = "app"
  environment                                    = "test"
  nat_gateway_enabled                            = true
  availability_zones                             = ["ap-southeast-2a", "ap-southeast-2b"]
  vpc_id                                         = module.vpc.id
  type                                           = "public-private"
  igw_id                                         = module.vpc.igw_id
  cidr_block                                     = module.vpc.vpc_cidr_block
  ipv6_cidr_block                                = module.vpc.ipv6_cidr_block
  public_subnet_assign_ipv6_address_on_creation  = true
  enable_ipv6                                    = true
  private_subnet_assign_ipv6_address_on_creation = true
}
