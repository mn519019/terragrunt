# terragrunt.hcl

remote_state {
  backend = "s3"
  config = {
    bucket         = "tf-tfstate-ca-central-1-s3-tfstate"
    key            = "${path_relative_to_include()}.tfstate"
    region         = "ca-central-1"
    encrypt        = true
    dynamodb_table = "tf-tfstate-ca-central-1-dynamodb-locktable"
  }
}

terraform {
    extra_arguments "reconfigure" { 
        commands = ["init"] 
        arguments = ["-reconfigure"]
    }
}

# include {
#   path = find_in_parent_folders()
# }

