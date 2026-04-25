provider "aws" {
    region = "ap-south-1"
    alias = "india"
}

variable "ami" {
    description = "AMI Value of the isntance"
    type = string
    default = ""
}

variable "type" {
    description = "specifies the type of the isntance"
    type = string
    default = "t3.micro"
}


variable "name" {
    description = "specify the tag value here"
    type = string
}


resource "aws_instance" "demo" {
    ami = var.ami
    instance_type = var.type
    tags = {
      Name = var.name
    }
    provider = aws.india
    
}