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
resource "aws_instance" "test" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  count         = "1"
  lifecycle {
      create_before_destroy = true
    }
  tags = {
    Name = "HelloWorld"
  }
}
