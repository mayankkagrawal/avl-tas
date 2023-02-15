########
#Global#
########
variable "project_id" {
  type        = string
  description = "The GCP project ID"
}

variable "region" {
  type        = string
  description = "Region where the instance template and instance should be created."
}

##########
#Instance#
##########
variable "machine_type" {
  description = "Machine type to create, e.g. n1-standard-1"
}

###################
#Network-Interface#
###################
variable "network" {
  description = "The name or self_link of the network to attach this interface to. Use network attribute for Legacy or Auto subnetted networks and subnetwork for custom subnetted networks."
  default     = ""
}

variable "subnetwork" {
  description = "The name of the subnetwork to attach this interface to. The subnetwork must exist in the same region this instance will be created in. Either network or subnetwork must be provided."
  default     = ""
}



###########
#Disk Info#
###########
variable "boot_disk0_info" {
  description = "The information of boot disk of GCE instance."
}



########
#Labels#
########
variable "instance_labels" {
  type        = map(string)
  description = "Instance Labels, provided as a map"
  default     = {}
}

variable "disk_labels" {
  type        = map(string)
  description = "Disk Labels, provided as a map"
  default     = {}
}

#################
#Service Account#
#################
variable "service_account" {
  type = object({
    email  = string
    scopes = set(string)
  })
  description = "Service account to attach to the instance"
}