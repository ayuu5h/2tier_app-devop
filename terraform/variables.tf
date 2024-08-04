provider "aws" {
  region     = "eu-north-1"
}
ubuntu@ip-172-31-32-104:~/Master_Project/terraform$ cat variables.tf 
variable "aws_region" {
  default = "eu-north-1"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  default = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  default = "10.0.2.0/24"
} 
