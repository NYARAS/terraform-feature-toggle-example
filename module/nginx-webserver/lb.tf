resource "aws_lb_target_group" "nginx-webserver" {
  name     = "nginx-webserver-v${var.infrastructure_version}"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.nginx-webserver.id

  health_check {
    port     = 80
    protocol = "HTTP"
    timeout  = 5
    interval = 10
  }
}

resource "aws_lb_target_group_attachment" "nginx-webserver" {
  count            = length(aws_instance.nginx-webserver)
  target_group_arn = aws_lb_target_group.nginx-webserver.arn
  target_id        = aws_instance.nginx-webserver[count.index].id
  port             = 80
}


resource "aws_lb" "nginx-webserver" {
    count  = var.load_balancing_enabled ? 1 : 0
  name               = "nginx-webserver-v${var.infrastructure_version}"
  internal           = false
  load_balancer_type = "application"
  subnets            = aws_subnet.nginx-webserver.*.id

  security_groups = [aws_security_group.nginx-webserver.id]

  tags = {
    Name = "nginx-webserver-v${var.infrastructure_version}"
  }
}

resource "aws_lb_listener" "nginx-webserver" {
    count = var.load_balancing_enabled ? 1 : 0
  load_balancer_arn = aws_lb.nginx-webserver[0].arn
  port              = "80"
  protocol          = "HTTP"


  default_action {
    target_group_arn = aws_lb_target_group.nginx-webserver.arn
    type             = "forward"
  }

  lifecycle {
    create_before_destroy = false
  }
}
