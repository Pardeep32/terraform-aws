terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"

    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.aws-region
}


resource "aws_instance" "web1" {
  ami           = var.ami_id["linux"]
  instance_type = var.instance_type["micro"]

  tags = {
    Name = "HelloWorldinstance"
  }
}

resource "aws_instance" "web2" {
  ami           = var.ami_id["ubuntu"]
  instance_type = var.instance_type["medium"]

  tags = {
    Name = "HelloWorldinstance"
  }
}
