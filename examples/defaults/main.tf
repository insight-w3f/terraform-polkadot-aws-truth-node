variable "public_key_path" {}
variable "private_key_path" {}

module "network" {
  source = "github.com/insight-infrastructure/terraform-aws-polkadot-network.git?ref=master"
  sentry_enabled = true
  num_azs = 1
}

module "default" {
  source            = "../.."
  public_key        = file(var.public_key_path)
  subnet_id         = module.network.public_subnets[0]
  security_group_id = module.network.sentry_security_group_id
  private_key_path  = var.private_key_path
}
