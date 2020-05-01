variable "subnet_id" {
  description = "The id of the subnet."
  type        = string
  default     = ""
}

variable "security_group_id" {
  description = "The id of the security group to run in"
  type        = string
}

variable "node_name" {
  description = "Name of the node"
  type        = string
  default     = ""
}

variable "root_volume_size" {
  description = "Root volume size"
  type        = string
  default     = 0
}

variable "instance_type" {
  description = "Instance type"
  type        = string
  default     = "t2.micro"
}

variable "public_key" {
  description = "The public ssh key. key_name takes precidence"
  type        = string
  default     = ""
}

variable "private_key_path" {
  description = "Path to private key"
  type        = string
  default     = ""
}

variable "storage_driver_type" {
  description = "Type of EBS storage the instance is using (nitro/standard)"
  type = string
  default = "standard"
}

variable "chain" {
  description = "Which Polkadot chain to join"
  type        = string
  default     = "kusama"
}

variable "ssh_user" {
  description = "Username for SSH"
  type        = string
  default     = "ubuntu"
}

variable "project" {
  description = "Name of the project for node name"
  type        = string
  default     = "project"
}

variable "region" {
  description = "The AWS region where the bucket should be located"
  type = string
  default = "us-east-1"
}