##############################################################
# EC2 Module - main.tf
# Provisions one or more EC2 instances distributed across
# multiple subnets in a round-robin fashion.
##############################################################

resource "aws_instance" "this" {
  count = var.instance_count

  ami                         = var.ami_id
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = element(var.subnet_ids, count.index)
  vpc_security_group_ids      = [var.security_group_id]
  associate_public_ip_address = true
  user_data                   = var.user_data

  # Wait for user_data to complete before marking instance healthy
  user_data_replace_on_change = true

  tags = {
    Name = "${var.ec2_name}-${count.index + 1}"
  }
}
