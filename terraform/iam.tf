provider "aws" {
  region = "ap-northeast-2"
}

variable "is_jhon" {
  type = bool
  default = true
}

locals {
  message = var.is_jhon ? "Hello John!":"Hello!"
}

output "message" {
  value = local.message
}

variable "internet_gateway_enabled" {
  type = bool
  default = true
}

resource "aws_vpc" "this" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_internet_gateway" "this" {
  count = var.internet_gateway_enabled ? 1 : 0

  vpc_id = aws_vpc.this.id
}