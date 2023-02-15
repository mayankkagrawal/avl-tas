# Google Compute Engine Linux


This module makes it easy to create one or more Linux based Compute engine instance with External IP, Boot disk, Additional Disk and NAT Gateway


## Usage

Basic usage of this module is as follows:


```hcl
resource "google_compute_instance" "gce_vm" {
  name         = var.machine_name
  machine_type = var.machine_type
  zone         = var.machine_zone

  allow_stopping_for_update = true
  deletion_protection       = var.vm_deletion_protect

  tags = var.network_tags

  boot_disk {
    auto_delete = false
    source      = google_compute_disk.boot_gce_disk.id
  }

  network_interface {
    network    = var.network
    subnetwork = var.subnetwork
    network_ip = google_compute_address.static_internal_ip_address.address

    dynamic "access_config" {
      for_each = local.access_config
      content {
        nat_ip       = google_compute_address.static_external_ip_address[0].address
        network_tier = "PREMIUM"
      }
    }
  }

  lifecycle {
    ignore_changes = [attached_disk]
  }

  labels = var.instance_labels

  dynamic "service_account" {
    for_each = [var.service_account]
    content {
      email  = lookup(service_account.value, "email", null)
      scopes = lookup(service_account.value, "scopes", null)
    }
  }

  metadata = var.metadata

}


```


## Inputs


| Name | Description | Type
|------|-------------|------|
| name | The name of the vm | string |
| machine_type | Vm type such as n1-standrad-1. | string |
| deletion_protection | Prevent vm from deletion | string |
| zone | Zone of the disk | string |
| network_tags | Attach network tag, Network tag allows to enforce firewall rule on this vm | string |
| labels | Key-value map of labels to assign to vm | map |
| metadata | Key-value map of labels to assign to vm, it can be startup script or shutdown script for vm | map |
| network | VPC network on which vm will be deployed | string |
| subnetwork | VPC sub-network on which vm will be deployed | string |
| network_ip | Static external ip to be attached to vm. External IP can be static or ephemeral  | string |
| nat_ip  | NAT Gateway to be attached on vm, to connect with internet  | string |
| service_accoun | Service account to be attached to the vm. | string |


## Requirements
- Terraform v0.12
- Service Account
User or service account credentials with the following roles must be used to provision the resources of this module: <br>
Compute Instance Admin v1: roles/compute.instanceAdmin.v1




