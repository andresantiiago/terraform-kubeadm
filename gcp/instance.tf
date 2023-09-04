resource "google_service_account" "kubeadm" {
  account_id   = "svcacc_kubeadm"
  display_name = "Service Account for Kubeadm"
}

module "vm_instance_template" {
  source  = "terraform-google-modules/vm/google//modules/instance_template"
  version = "9.0.0"
  
  service_account   = google_service_account.kubeadm.email
  can_ip_forward    = "true"

  disk_size_gb      = local.local_vars.gcp.instance.control_plane.disk_size_gb
  disk_type         = local.local_vars.gcp.instance.control_plane.disk_type

  machine_type      = local.local_vars.gcp.instance.control_plane.machine_type
}

module "vm_compute_instance" {
  source  = "terraform-google-modules/vm/google//modules/compute_instance"
  version = "9.0.0"

  instance_template = module.vm_instance_template.self_link
  hostname          = "control-plane-kubeadm"

}