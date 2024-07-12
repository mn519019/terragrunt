
locals {
  common_vars = read_terragrunt_config("../config/qa-config.hcl")
}

# This is needed to reference backend remote file
include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "../module//ec2"
}

inputs = {
  region        = local.common_vars.locals.region
  ami           = local.common_vars.locals.ami
  instance_type = local.common_vars.locals.instance_type
  key_name      = local.common_vars.locals.key_name
  iam_role      = local.common_vars.locals.iam_role
  env           = local.common_vars.locals.env

}
