provider "aws"{
    alias = "India"
    region = "ap-south-1"
}

provider "aws"{
    alias = "us"
    region = "us-east-1"
}


resource "aws_security_group" "India_sg" {
    ingress {
        description = "ssh access"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        description = "http access"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
      Name : "Demo-sg-In"
    }
}

resource "aws_instance" "In_instance" {
    ami = var.India_ami
    instance_type = var.type
    tags = {
      Name = "demo_ec2_In"
    }
    provider = aws.India
    vpc_security_group_ids = [aws_security_group.India_sg.id]
}


resource "aws_security_group" "us_sg" {
    ingress {
        description = "ssh access"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        description = "http access"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
      Name : "Demo-sg-us"
    }
}

resource "aws_instance" "us_instance" {
    ami = var.us_ami
    instance_type = var.type
    tags = {
        Name = "demo_ec2_us"
    }
    provider = aws.us
    vpc_security_group_ids = [aws_security_group.us_sg.id]
}

