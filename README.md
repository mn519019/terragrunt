# Example infrastructure-live for Terragrunt

## How do you deploy multi environment terraform infrastructures in AWS 
```
Terraform is an IAC tool that you can manage cloud infrastructures in a consisntent manner. However, when you manage multiple environments, terraform code can be messy and duplicated. Thus, Terragrunt has been intorduced to ensure terraform code can stay as dry as possible. The rational behind of Terragrunt is adopting a module-based terraform code and use it to deploy multiple environments wiht minimal repetition. 
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