 # module "disk_policy_creation" {
#   source = "../../../../../../modules/compute_engine/disk_snapshot_policy"

#   /* global */
#   policy_name      = var.disk_snapshot_policy_name
#   utc_time         = "06:00"
#   retention_days   = "15"
#   storage_location = "us"
# }


module "vm01" {
  source = "../../modules/linux_vm"

  /* global */
  project_id = var.project_id
  region     = var.region

  /* machine details */
  machine_name        = "avl-vm"
  machine_type        = var.machine_type
  machine_zone        = "asia-south1-a"
  instance_labels     = var.instance_labels
  vm_deletion_protect = true
  instance_image_selflink = "projects/ubuntu-os-cloud/global/images/ubuntu-1804-bionic-v20210928"

  /* network details */
  network            = var.network
  subnetwork         = var.subnetwork
  network_tags       = ["allow-ssh", "allow-jenkins", "allow-docker"]
  internal_ip        = "10.0.0.13"
  enable_external_ip = true

  /* disk details */
  boot_disk_info       = var.boot_disk0_info["mgmt_vm01"]
  disk_labels          = var.disk_labels

  /* service account */
  service_account = var.service_account
}

