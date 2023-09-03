locals {
    local_vars = yamldecode("../vars/vars.yaml")
}

provider "google" {
  project     = local.local_vars.gcp.project
  region      = local.local_vars.gcp.region
}