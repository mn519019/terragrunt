locals {
  common_vars = read_terragrunt_config("../config/dev-config.hcl")
}

# This is needed to reference backend remote file
include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "../module//ec2"
}

inputs = {
  # A hardcoded example
  # region        = "ca-central-1"
  # ami           = "ami-0083d3f8b2a6c7a81"
  # instance_type = "t2.micro"
  # key_name      = "MyDemo"
  # env           = "dev"

  region        = local.common_vars.locals.region
  ami           = local.common_vars.locals.ami
  instance_type = local.common_vars.locals.instance_type
  key_name      = local.common_vars.locals.key_name
  env           = local.common_vars.locals.env

}
