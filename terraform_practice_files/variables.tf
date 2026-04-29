variable "India_ami" {
    description = "this is used to get an give ami value for India"
    type = string
}
variable "us_ami" {
    description = "it is passed to the instance creation in US region"
}
variable "instance_name" {
    description = "give an name for the instance"
    type = string
}

variable "type" {
    description = "define the type of instance"
    type = string
}

