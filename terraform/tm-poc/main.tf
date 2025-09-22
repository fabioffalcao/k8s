terraform {
  required_version = ">= 1.3"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 5.0"

  name           = "poc-ec2"
  ami            = var.ami_id
  instance_type  = "t2.micro"
  key_name       = var.key_pair_name

  subnet_id      = var.subnet_id

  vpc_security_group_ids = [module.security_group.security_group_id]

  tags = {
    Project = "poc-demo"
  }
}

module "security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 5.0"

  name        = "poc-sg"
  description = "Allow SSH"
  vpc_id      = var.vpc_id

  ingress_rules = ["ssh-tcp"]
  egress_rules  = ["all-all"]
}
