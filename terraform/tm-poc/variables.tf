variable "aws_region" {
  description = "Região AWS"
  type        = string
  default     = "us-east-1"
}

variable "key_pair_name" {
  description = "Nome de um Key Pair já existente para acesso SSH"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}
