##############################################################
# ALB Module - main.tf
# Provisions an Application Load Balancer with a target group,
# health checks, and an HTTP listener.
##############################################################

# ── Application Load Balancer ─────────────────────────────────
resource "aws_lb" "this" {
  name               = var.alb_name
  internal           = var.alb_type == "internal" ? true : false
  load_balancer_type = "application"
  security_groups    = [var.security_group_id]
  subnets            = var.subnet_ids

  enable_deletion_protection = false

  tags = {
    Name = var.alb_name
  }
}

# ── Target Group ──────────────────────────────────────────────
resource "aws_lb_target_group" "this" {
  name     = "${var.alb_name}-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    enabled             = true
    path                = "/"
    port                = "traffic-port"
    protocol            = "HTTP"
    healthy_threshold   = 3
    unhealthy_threshold = 3
    timeout             = 5
    interval            = 30
    matcher             = "200-299"
  }

  tags = {
    Name = "${var.alb_name}-tg"
  }
}

# ── Target Group Attachments (EC2 instances) ──────────────────
resource "aws_lb_target_group_attachment" "this" {
  count = length(var.instance_ids)

  target_group_arn = aws_lb_target_group.this.arn
  target_id        = var.instance_ids[count.index]
  port             = 80
}

# ── HTTP Listener on port 80 ──────────────────────────────────
resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.this.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.this.arn
  }

  tags = {
    Name = "${var.alb_name}-listener"
  }
}
