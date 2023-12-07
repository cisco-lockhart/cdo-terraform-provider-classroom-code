module "bastion" {
  source              = "./modules/aws-bastion"
  vpc_id              = module.aws_network.vpc_id
  subnet_id           = module.aws_network.public_subnet_id
  classroom_namespace = var.classroom_namespace
  enable_ssh_access   = true
}
