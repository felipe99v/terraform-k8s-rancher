output "private_db_subnets_id" {
  value = aws_subnet.private_BD_subnets[*].id
}

output "private_app_subnets_id" {
  value = aws_subnet.private_app_subnets[*].id
}

output "public_app_subnets_id" {
  value = aws_subnet.public_app_subnets[*].id
}

output "public_subnet_1a_id" {
  value = aws_subnet.public_app_subnets[0].id
}


output "vpc_main_id" {
  value = aws_vpc.vpc_main.id
}

output "vpc_main_cidr" {
  value = aws_vpc.vpc_main.cidr_block
}

output "vpc_app_routetable_app_id" {
  value = aws_route_table.private_app_rt.id
}

output "vpc_app_routetable_public_id" {
  value = aws_route_table.public_app_rt.id
}