locals {  
  region        = "ca-central-1"
  ami           = "ami-0083d3f8b2a6c7a81"
  instance_type = "t2.micro"
  key_name      = "MyDemo"
  iam_role      = "ec2_ssm_role"
  env           = "qa"  
}