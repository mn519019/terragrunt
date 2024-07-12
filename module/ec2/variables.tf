variable "region" {
  type        = string
  description = "Name of the region"
  default     = "ca-central-1"
}

variable "ami" {
  type        = string
  description = "Name of the ami"
}

variable "instance_type" {
  type        = string
  description = "Name of the instance_type"
}

variable "key_name" {
  type        = string
  description = "Name of the keyname"
}

variable "env" {
  type        = string
  description = "Name of the environment"
}

variable "iam_role" {
  type        = string
  description = "Name of the iamrole"
}