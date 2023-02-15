output "name" {
  description = "Name of Instance"
  value       = google_compute_instance.gce_vm.name
}

output "compute_instance_id" {
  description = "Compute instance id"
  value       = google_compute_instance.gce_vm.id
}

output "machine_zone" {
  description = "Compute instance zone"
  value       = var.machine_zone
}
