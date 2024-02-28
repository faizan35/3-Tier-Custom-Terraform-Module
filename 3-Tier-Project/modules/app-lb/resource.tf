# app-lb
resource "aws_lb" "app_lb" {
  name               = "test-lb-tf"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [ var.Sg_ID ]
  subnets            = [ var.Subnet_ID[0], var.Subnet_ID[1] ]

  tags = {
    Name = "hulk-app_lb"
  }
}

# Target Group
resource "aws_lb_target_group" "tar-grp" {
  name     = "hulk-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.VPC_ID

  tags = {
    Name = "hulk-tg"
  }
}


# Attach TG to app-lb
resource "aws_lb_target_group_attachment" "attach-tg-alb" {
  target_group_arn = aws_lb_target_group.tar-grp.arn
  count            = length(var.tar-id-instance-alb)
  target_id        = var.tar-id-instance-alb[count.index]
  port             = 80
}



# listners

resource "aws_lb_listener" "listner" {
  load_balancer_arn = aws_lb.app_lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tar-grp.arn
  }
}







