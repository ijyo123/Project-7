resource "aws_lb" "project7-lb" {
  name               = "project7-lb-tf"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb-SG.id]

  subnet_mapping {
    subnet_id            = aws_subnet.Privatesubnet1.id
    private_ipv4_address = "10.0.1.24"
  }

  subnet_mapping {
    subnet_id            = aws_subnet.Privatesubnet2.id
    private_ipv4_address = "10.0.2.24"
  }

enable_deletion_protection = false

  tags = {
  Name ="project7-lb"
  }

  #Create Target Group
resource "aws_lb_target_group" "alb-tg" {
  name        = "project7alb-tg"
  port        = 80
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = aws_vpc.project7-VPC.id
  }

#Create ALB Listener
resource "aws_lb_listener" "alb-listener" {
  load_balancer_arn = aws_lb.project7-lb.id
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = "arn:aws:iam::187416307283:server-certificate/test_cert_rab3wuqwgja25ct3n4jdj2tzu4"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb-tg.arn
  }
}