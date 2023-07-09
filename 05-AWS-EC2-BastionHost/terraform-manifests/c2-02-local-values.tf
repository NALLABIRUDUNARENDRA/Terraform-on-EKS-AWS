locals {
  owners = var.business_division
  env = var.env
  name = "${var.business_division}-${var.env}"
 #name = "${local.owners}-${local.env}"   
 common_tags = {
    owners = "local.owners"
    env = "local.env"
 }
 # ADD ADDITIONAL LOCAL VALUE
 eks_cluster_name = "${local.name}-${var.cluster_name}"


}

