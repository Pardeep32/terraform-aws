resource "aws_vpc" "mainvpc" {
  cidr_block = "10.1.0.0/16"
}

resource "aws_subnet" "subnet1" {
  vpc_id            = aws_vpc.mainvpc.id
  cidr_block        = "10.1.1.0/24"
  availability_zone = "ca-central-1a"
}

resource "aws_security_group" "mysecuritygroup" {
  name        = "mysecuritygroup"
  vpc_id      = aws_vpc.mainvpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_instance" "first_ec2" {
  ami                  = "ami-0a2e7efb4257c0907"
  instance_type        = "t2.micro"
  subnet_id            = aws_subnet.subnet1.id
  security_groups      = [aws_security_group.mysecuritygroup.id]
  availability_zone    = "ca-central-1a"
  associate_public_ip_address = true
  tags = {
    Name = "HelloWorld"
  }
}


