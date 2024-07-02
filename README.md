# Example infrastructure-live for Terragrunt

## How do you deploy multi environment terraform infrastructures in AWS 
```
Terraform is an IAC tool that you can manage cloud infrastructures in a consisntent manner.

However, when you manage multiple environments, terraform code can be messy and duplicated.

Thus, Terragrunt has been intorduced to ensure terraform code can stay as dry as possible.

The rational behind of Terragrunt is adopting a module-based terraform code and use it to deploy multiple environments wiht minimal repetition. 
```

### Pre-requisites
- AWSCLI V2
- Pre-configured remote backend (S3 & Dynamo DB)
- Terraform 1.xx or above
- Terragrunt 0.5x or above

### Project Hierarchy
``` 
├── README.md
├── config
│   ├── dev-config.hcl
│   └── qa-config.hcl
├── ec2_dev
│   └── terragrunt.hcl
├── ec2_qa
│   └── terragrunt.hcl
├── module
│   └── ec2
│       ├── main.tf
│       └── variables.tf
└── terragrunt.hcl
``` 

### Project Information
```
# update terragrunt.hcl file to match with your remote_backend configuration
# update config/XX-config.hcl based on your needs 
# update module as you need

- Config: This is specifying configuration for the terraform module
- ec2_dev: Terragrunt file provisioning ec2 for dev environment
- ec2_qa: Terragrunt file provisioning ec2 for qa environment
- module: Terraform module provisioning the ec2 machine. It's a backbone for terragrunt files
- terragrunt.hcl: Backend Information is specified here
```

### HowTo
- This example will create a ec2 machine for dev environment
- Same concept can be applied into qa deployment just creating a new terragrunt file
```
# Clone the file
cd /tmp/
git clone https://github.com/mn519019/terragrunt.git
cd terragrunt; ls;

## Exepcetd output
README.md  config  ec2_dev  ec2_qa  module  terragrunt.hcl

# Terraform Version Check
terraform --version

## Exepcetd output
Terraform v1.6.0

# Terragrunt Version Check
terragrunt --version

## Exepcetd output
terragrunt version v0.59.6

cd ec2_dev; terragrunt init; terragrunt apply;

## Expected output
Terraform used the selected providers to generate the following execution
plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_instance.my_instance will be created
  + resource "aws_instance" "my_instance" {
      + ami                                  = "ami-0083d3f8b2a6c7a81"
      + arn                                  = (known after apply)
      + associate_public_ip_address          = (known after apply)
      + availability_zone                    = (known after apply)
      + cpu_core_count                       = (known after apply)
      + cpu_threads_per_core                 = (known after apply)
      + disable_api_stop                     = (known after apply)
      + disable_api_termination              = (known after apply)
      + ebs_optimized                        = (known after apply)
      + get_password_data                    = false
      + host_id                              = (known after apply)
      + host_resource_group_arn              = (known after apply)
      + iam_instance_profile                 = (known after apply)
      + id                                   = (known after apply)
      + instance_initiated_shutdown_behavior = (known after apply)
      + instance_lifecycle                   = (known after apply)
      + instance_state                       = (known after apply)
      + instance_type                        = "t2.micro"
      + ipv6_address_count                   = (known after apply)
      + ipv6_addresses                       = (known after apply)
      + key_name                             = "MyDemo"
      + monitoring                           = (known after apply)
      + outpost_arn                          = (known after apply)
      + password_data                        = (known after apply)
      + placement_group                      = (known after apply)
      + placement_partition_number           = (known after apply)
      + primary_network_interface_id         = (known after apply)
      + private_dns                          = (known after apply)
      + private_ip                           = (known after apply)
      + public_dns                           = (known after apply)
      + public_ip                            = (known after apply)
      + secondary_private_ips                = (known after apply)
      + security_groups                      = (known after apply)
      + source_dest_check                    = true
      + spot_instance_request_id             = (known after apply)
      + subnet_id                            = (known after apply)
      + tags                                 = {
          + "Name" = "Test-VM-dev"
          + "env"  = "dev"
        }
      + tags_all                             = {
          + "Name" = "Test-VM-dev"
          + "env"  = "dev"
        }
      + tenancy                              = (known after apply)
      + user_data                            = (known after apply)
      + user_data_base64                     = (known after apply)
      + user_data_replace_on_change          = false
      + vpc_security_group_ids               = (known after apply)
    }

Plan: 1 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

aws_instance.my_instance: Creating...
aws_instance.my_instance: Still creating... [10s elapsed]
aws_instance.my_instance: Still creating... [20s elapsed]
aws_instance.my_instance: Still creating... [30s elapsed]
aws_instance.my_instance: Creation complete after 32s [id=i-0508e7193fe553175]

#### Verification #########################################################
# Now we know that the instance id is 
"i-0508e7193fe553175", so we validate whether it's created 
###########################################################################

aws ec2 describe-instances --filters "Name=tag:env, Values=dev" --query 'Reservations[].Instances[].InstanceId' --output text

## Expected output
i-0508e7193fe553175
```