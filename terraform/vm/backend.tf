terraform {
  backend "gcs" {
    bucket = "gtm-log-bucket"
    prefix = "terraform/vm"
  }
}
