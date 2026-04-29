provider "aws"{
    alias = "India"
    region = "ap-south-1"
}

provider "aws"{
    alias = "us"
    region = "us-east-1"
}

resource "aws_instance" "In_instance" {
    ami = var.ami
    instance_type = var.type
    tags = {
      Name = "demo_ec2"
    }
    provider = aws.India
    security_groups = [aws_security_group.sg.id]
}
