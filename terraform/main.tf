
# Configure the AWS Provider
provider "aws" {
  profile = "default"
  region  = "us-west-2"
}
data "aws_caller_identity" "current" {}
data "aws_region" "current" {}
data "aws_ami" "ubuntu" {
    most_recent = true

    filter {
        name   = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
    }

    filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }

    owners = ["099720109477"] # Canonical
}
locals {
  instance_type_map = {
   stage = "t2.nano"
   prod = "t2.micro"
  }
  instance_сount_map = {
   stage = 1
   prod = 2
  }
  instance_сount = {
    stage = ["0"]
    prod  = ["0", "1"]
  }
}

# Configure the Amazon Machine Image
resource "aws_instance" "test" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = local.instance_type_map[terraform.workspace]
  count         = local.instance_сount_map[terraform.workspace]
  lifecycle {
      create_before_destroy = true
    }
  tags = {
    Name = "HelloWorld"
  }
}

# Configure the Amazon Machine Image 2
resource "aws_instance" "test_2" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = local.instance_type_map[terraform.workspace]
  for_each      = toset(local.instance_сount[terraform.workspace])
}

# Create Amazon Simple Storage Service (S3) bucket
terraform {
  backend "s3" {
    bucket         = "tf-netology-test"
    key            = "tf-test/terraform.tfstate"
    region         = "us-west-2"
    encrypt        = true
  }
}
