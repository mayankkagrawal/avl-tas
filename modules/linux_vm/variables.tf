#################
# Global variables
#################
variable "project_id" {
  type        = string
  description = "The GCP project ID"
}

variable "machine_type" {
  description = "Machine type to create, e.g. n1-standard-1"
}

variable "instance_image_selflink" {
  description = "Compute Image to use, e.g. projects/ubuntu-os-cloud/global/images/ubuntu-1804-bionic-v20200610. Get it from console REST Response"
}

variable "machine_name" {
  description = "Hostname of instances"
}

variable "machine_zone" {
  description = "Zone in which the instance will be present"
}

variable "network_tags" {
  description = "Network tags, provided as a list"
}

variable "region" {
  type        = string
  description = "Region where the instance template and instance should be created."
}

############
# disk - details
############
variable "boot_disk_info" {
  description = "The information of boot disk of GCE instance."
}

variable "vm_deletion_protect" {
  type        = bool
  description = "The prevent deletion of a GCE instance on accidental terraform destroy or from console"
  default     = true
}

variable "snapshot_policy_name" {
  description = "The name of the snapshot_policy_name to attach this disk to"
  default     = ""
}

####################
# network-interface
####################
variable "network" {
  description = "The name or self_link of the network to attach this interface to. Use network attribute for Legacy or Auto subnetted networks and subnetwork for custom subnetted networks."
  default     = ""
}

variable "subnetwork" {
  description = "The name of the subnetwork to attach this interface to. The subnetwork must exist in the same region this instance will be created in. Either network or subnetwork must be provided."
  default     = ""
}

variable "internal_ip" {
  description = "The static internal address for the GCE instance."
}

##################
# Service Account
##################
variable "service_account" {
  type = object({
    email  = string
    scopes = set(string)
  })
  description = "Service account to attach to the instance."
}

###########################
# Static External IP
###########################
variable "enable_external_ip" {
  type        = bool
  description = "Instance External IP required or not"
  default     = false
}

##################
# Labels
##################

variable "instance_labels" {
  type        = map(string)
  description = "Instance Labels, provided as a map"
  default     = {}
  # instance_labels = {
  # env             = "prod"
  # group_name      = "app-group"
  # owner           = "admin"
  # team            = "cloud"
  # app_name        = "portal"
  # software_vers   = "v1.2"
  # }
}

variable "disk_labels" {
  type        = map(string)
  description = "Disk Labels, provided as a map"
  default     = {}
  # disk_labels = {
  # env             = "prod"
  # group_name      = "app-group"
  # instance_name   = "prod-projectid-app-group-us-ct1-a-01"
  # }
}

###########
# Metadata
###########

variable "metadata" {
  type        = map(string)
  description = "Metadata, provided as a map"
  default     = {}
}
