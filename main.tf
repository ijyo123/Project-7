# Create a VPC
resource "aws_vpc" "project7-VPC" {
  cidr_block       = "10.0.0.0/16"
  
  tags = {
    Name = "project7-VPC"
  }
}
#Create Private subnet 1

  resource "aws_subnet" "Privatesubnet1" {
  vpc_id     = aws_vpc.project7-VPC.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "Privatesubnet1"
  }
}
# Create Private subnet 2
 resource "aws_subnet" "Privatesubnet2" {
  vpc_id     = aws_vpc.project7-VPC.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "Privatesubnet2"
  }
} 

