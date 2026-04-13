
aws_region          = "us-east-1"
project_name        = "gotto-job"
vpc_name            = "gotto-job-vpc"
vpc_cidr            = "10.0.0.0/16"
public_subnet_count = 3
ingress_ports       = [80, 443, 22]
ec2_instance_count  = 3
instance_type       = "t2.micro"
key_name            = "aws"   
