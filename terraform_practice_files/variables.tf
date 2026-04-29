variable "ami" {
    description = "this is used to get an give ami value"
    type = string
}

variable "instance_name" {
    description = "give an name for the instance"
    type = string
}

variable "type" {
    description = "define the type of instance"
    type = string
}

resource "aws_security_group" "sg" {
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
}