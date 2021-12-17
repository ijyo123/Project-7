#Create Security group
resource "aws_security_group" "alb-SG" {
  name        = "alb security group"
  description = "http inbound traffic"
  vpc_id      = aws_vpc.project7-VPC.id

  
   ingress {
      description      = "http from VPC"
      from_port        = 80
      to_port          = 80
      protocol         = "tcp"
      cidr_blocks      = [aws_vpc.project7-VPC.cidr_block]
    }

 ingress {
    description      = "http access"
      from_port        = 443
      to_port          = 443
      protocol         = "tcp"
      cidr_blocks      = [aws_vpc.project7-VPC.cidr_block]
    }
  

    egress {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
    }

  tags = {
    Name = "allow_http"
  }
}