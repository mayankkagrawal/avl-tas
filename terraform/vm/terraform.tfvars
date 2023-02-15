#Global
project_id = "test-env-project-373606"
region     = "asia-south1"

#Machine Details
machine_type = "n2-standard-2"

#Network Interface
network      = "new-vpc"
subnetwork   = "new-subnet"

# Boot disk info for all mgmt group VMs
boot_disk0_info = {
  mgmt_vm01 = {
    disk_size_gb = 30
    disk_type    = "pd-standard"
  }
}

#Labels
instance_labels = {
  owner      = "mayank"
}

disk_labels = {
  name = "mayank-disk"
}

#Access scopes 
service_account = {
  email  = "gcp-sa@test-env-project-373606.iam.gserviceaccount.com"
  scopes = ["cloud-platform"]
}