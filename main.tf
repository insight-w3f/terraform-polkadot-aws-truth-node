module "node" {
  source = "github.com/insight-w3f/terraform-polkadot-aws-node.git?ref=master"
  security_group_id = var.security_group_id
  subnet_id = var.subnet_id
  node_name = var.node_name
  root_volume_size = var.root_volume_size
  instance_type = var.instance_type
  public_key = var.public_key
  private_key_path = var.private_key_path
  node_purpose = "library"
  chain = var.chain
  project = var.project
  mount_volumes = false
}

module "ansible" {
  source = "github.com/insight-infrastructure/terraform-aws-ansible-playbook.git?ref=v0.12.0"

  ip                     = module.node.public_ip
  user                   = var.ssh_user
  private_key_path       = var.private_key_path
  playbook_file_path     = "${path.module}/ansible/main.yml"
  requirements_file_path = "${path.module}/ansible/requirements.yml"
  forks                  = 1

  playbook_vars = {
    aws_access_key_id: aws_iam_access_key.sync.id,
    aws_secret_access_key: aws_iam_access_key.sync.secret,
    sync_bucket_uri: aws_s3_bucket.sync.id,
    region: var.region,
  }

  module_depends_on = module.node
}
