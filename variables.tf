variable "aws_vpc_cidr" {
}
variable "aws_webserver_subnet_cidr" {
}
variable "aws_natgateway_subnet_cidr" {
}
variable "aws_jumpbox_subnet_cidr" {
}
variable "aws_businesslogic_subnet_cidr" {
}
variable "aws_database_subnet_cidr" {
}
variable "aws_region" {
  description = "AWS region to launch servers."
  default     = "us-east-2"
}
variable "primary_az" {
  description = "primary AZ"
  default     = "us-east-2a"
}
variable "secondary_az" {
  description = "secondary AZ"
  default     = "us-east-2b"
}

