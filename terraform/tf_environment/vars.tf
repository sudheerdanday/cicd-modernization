# # variable "tenancy_ocid" {}

# # variable "user_ocid" {}

# # variable "fingerprint" {}

# # variable "private_key_path" {}

# # variable "compartment_ocid" {
# #   description = "Compartment OCID"
# # }

# # variable "region" {
# #   description = "region Example: us-ashburn-1."
# # }

# # variable "vcn_ocid" {
# #   description = "The OCID VCN"
# # }

variable "customer_name" {}

# # variable "export_path" {}

# # variable "availability_domain" {}

# # variable "mount_target_id" {}

# # variable "oracle_image_ocid" {
# #   description = "Example: Oracle-Linux-7.8-2020.09.23-0"
# # }

# # variable "k8s_cluster_ocid" {}

# # variable "node_shape" {}

# # variable "kubernetes_version" {}

# # variable "node_shape_config_ocpus" {}

# # variable "node_shape_config_memory_in_gbs" {}

# variable "need_subnet" {
#   type    = string
#   default = "false"
# }

# # variable "subnet_newbits" {}

# variable "availability_zone" {
#     description = "Availability zone to provision the volume in."
#     type = string
# }

# variable "encrypted" {
#     description = "Whether to encrypt the volume."
#     type = bool
#     default = false
# }

# variable "iops" {
#     description = "IOPS to provision."
#     type = number
#     default = null
# }

# variable "size" {
#     description = "Size of drive in GiBs."
#     type = number
# }

# variable "snapshot_id" {
#     description = "Snapshot to base the volume off of."
#     type = string
#     default = null
# }

# variable "volume_type" {
#     description = "Volume type."
#     type = string
#     default = null
# }

# variable "kms_key_id" {
#     description = "KMS key ID to encrypt the volume with."
#     type = string
#     default = null
# }

# variable "tags" {
#     description = "Tags to apply to volume."
#     type = map(string)
#     default = {}
# }
