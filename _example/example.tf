module "labels" {
  source  = "git::git@github.com:slovink/terraform-aws-labels.git"

  name        = var.name
  environment = var.environment
  managedby   = var.managedby
  label_order = var.label_order
  repository  = var.repository
}

module "vpc" {
  source = "git::git@github.com:slovink/terraform-aws-vpc-.git"

  vpc_enabled     = true
  enable_flow_log = false

  name        = "vpc"
  environment = var.environment
  label_order = var.label_order

  cidr_block    = var.cidr_block
 # s3_bucket_arn = module.s3-logs_bucket.arn
}

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
