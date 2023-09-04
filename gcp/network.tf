resource "google_compute_network" "vpc_network" {
  name                    = local.local_vars.gcp.vpc_name
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet_kubeadm" {
  name          = local.local_vars.gcp.subnet_name
  ip_cidr_range = local.local_vars.gcp.ip_range
  region        = local.local_vars.gcp.region
  network       = google_compute_network.vpc_network.id
}
