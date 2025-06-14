#Setting up AWS with Terraform
provider "aws" {
  region = "eu-west-2"
  profile = "AlberN3t"
}

#Creating the AWS EC2 Instance
resource "aws_instance" "myEC2" {
    ami = "ami-0bc8d5c547360e648" #Windows Sever 2025 Base AMI
    instance_type = "t2.micro"

    tags = {
      Name = "EC2_Test"
    }
}