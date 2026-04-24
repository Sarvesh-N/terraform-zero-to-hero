provider "aws" {
    region = "ap-south-1"
    alias = "india"
}

provider "aws"{
    region = "us-east-1"
    alias = "us"
}

resource "aws_instance" "demo_in_india"{
    ami = "ami-0e12ffc2dd465f6e4"
    instance_type = "t3.micro"
    key_name = "ubuntu"
    provider = aws.india
    tags = {
      Name = "demo_ec2_india"
    }
}

resource "aws_instance" "demo_in_us" {
    ami = "ami-098e39bafa7e7303d"
    instance_type = "t3.micro"
    key_name = "ubuntu"
    provider = aws.us
    tags = {
      Name = "demo_ec2_US"
    }
}


