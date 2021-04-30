provider "aws" {
  region     = "us-west-2"
  access_key = "AKIA4Q43I3K232JVKIUB"
  secret_key = "xpA8GLkm83pqalPjXD4aDvj2MLQ2+qZIJ9hlvicj"
}


resource "aws_ebs_volume" "example" {
  availability_zone = "us-west-2a"
  size              = 20
}

# module "fss" {
#   source              = "../modules/file_system"
#   compartment_ocid    = var.compartment_ocid
#   availability_domain = var.availability_domain
#   vcn_ocid            = var.vcn_ocid
#   customer_name       = var.customer_name
#   export_path         = var.export_path
#   mount_target_id     = var.mount_target_id
# }

# module "node-pool" {
#   source                          = "../modules/node_pool"
#   count                           = var.need_subnet == "true" ? 1 : 0
#   compartment_ocid                = var.compartment_ocid
#   availability_domain             = var.availability_domain
#   vcn_ocid                        = var.vcn_ocid
#   customer_name                   = var.customer_name
#   oracle_image_ocid               = var.oracle_image_ocid
#   k8s_cluster_ocid                = var.k8s_cluster_ocid
#   node_shape                      = var.node_shape
#   kubernetes_version              = var.kubernetes_version
#   node_shape_config_ocpus         = var.node_shape_config_ocpus
#   node_shape_config_memory_in_gbs = var.node_shape_config_memory_in_gbs
#   subnet_newbits                  = var.subnet_newbits
#   need_subnet                     = var.need_subnet
# }
