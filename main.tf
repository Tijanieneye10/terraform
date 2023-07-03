provider "aws" {
    region = "us-east-1"
}

variable "cidr_block" {
    description = "My variable here"
    default = "10.0.0.0/16"
}


resource "aws_vpc" "dev_vpc" {
    cidr_block = var.cidr_block
    tags = {
        Name: "created from Terraform"
        vpc_env: "Development environment"
    }
}

output "dev_resources_output" {
    value = aws_vpc.dev_vpc.id
}

# resource "aws_subnet" "dev_subnet" {
#     vpc_id = aws_vpc.dev_vpc.id
#     cidr_block = "10.0.10.0/24"
#     availability_zone = "us-east-1a"

# }

# data "aws_vpc" "existing_vpc" {
#     default = true
# }

# resource "aws_subnet" "dev_subnet_2" {
#     vpc_id = data.aws_vpc.existing_vpc.id
#     cidr_block = "10.0.10.0/24"
#     availability_zone = "us-east-1a"
# }