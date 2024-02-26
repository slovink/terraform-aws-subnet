output "public_subnet_cidrs" {
  value       = module.subnet.public_subnet_cidrs
  description = "The CIDR of the subnet."
}

output "public_subnet_cidrs_ipv6" {
  value       = module.subnet.public_subnet_cidrs_ipv6
  description = "The CIDR of the subnet."
}

output "public_tags" {
  value       = module.subnet.public_tags
  description = "A mapping of tags to assign to the resource."
}

output "public_subnet_id" {
  value       = module.subnet.private_subnet_id
  description = "The ID of the public subnet"
}

output "database_subnet_cidrs" {
  value       = module.subnet.database_subnet_cidrs
  description = "The CIDR of the subnet."
}

output "database_subnet_cidrs_ipv6" {
  value       = module.subnet.database_subnet_cidrs_ipv6
  description = "The CIDR of the subnet."
}

output "database_tags" {
  value       = module.subnet.database_tags
  description = "A mapping of tags to assign to the resource."
}

output "database_subnet_id" {
  value       = module.subnet.database_subnet_id
  description = "The ID of the database subnet"
}

output "private_subnet_cidrs" {
  value       = module.subnet.private_subnet_cidrs
  description = "The ID of the subnet."
}

output "private_tags" {
  value       = module.subnet.private_tags
  description = "A mapping of tags to assign to the resource."
}
