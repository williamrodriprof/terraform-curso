terraform {
  required_version = ">= 1.1.0"
  required_providers {
    aws = ">= 4.0"
  }
}

provider "aws" {
  profile                  = "default"
  shared_credentials_files = ["C:/Users/Dell/.aws/credentials"]
  region                   = "sa-east-1"
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web" {
  ami                     = data.aws_ami.ubuntu.id
  instance_type           = var.int_type
  disable_api_termination = var.disable_api_termination

  tags = {
    Name = "HelloWorld"
  }
}
