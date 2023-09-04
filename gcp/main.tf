locals {
    local_vars = yamldecode("../vars/${terraform.workspace}.yaml")
}

provider "google" {
  project     = local.local_vars.gcp.project
  region      = local.local_vars.gcp.region
}

terraform {
  backend "gcs" {
    bucket  = "tf-state-kubeadm"
  }
}