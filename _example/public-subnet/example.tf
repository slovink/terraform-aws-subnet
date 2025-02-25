provider "aws" {
  region = "eu-west-1"
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

module "subnet" {
  source             = "./../.."
  name               = "app"
  environment        = "test"
  availability_zones = ["eu-west-1a", "eu-west-1b", ]
  type               = "public"
  vpc_id             = module.vpc.id
  cidr_block         = module.vpc.vpc_cidr_block
  igw_id             = module.vpc.igw_id
  enable_ipv6        = false
}