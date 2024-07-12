provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {
    # Configured in terragrunt.hcl
  }
}

resource "aws_instance" "my_instance" {
  ami                  = var.ami  # Replace with your desired AMI ID
  instance_type        = var.instance_type
  iam_instance_profile = var.iam_role
  user_data            = file("script.sh")
  key_name             = var.key_name  # Replace with your key pair name
  tags                 = {
    Name = "Test-VM-${var.env}"
    env  = var.env

  }
}
