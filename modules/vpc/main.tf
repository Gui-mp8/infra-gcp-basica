#vpc/main.tf

resource "google_compute_network" "vpc_network" {
  name                    = var.vpc_name
  auto_create_subnetworks = false
  project                 = var.project_id
}

resource "google_compute_subnetwork" "subnet" {
  name          = "${var.vpc_name}-subnet"
  ip_cidr_range = "10.0.0.0/24"
  region        = var.region
  network       = google_compute_network.vpc_network.id
  project       = var.project_id

  # dynamic "log_config" {
  #   for_each = var.enable_flow_logs ? [1] : []
  #   content {
  #     aggregation_interval = "INTERVAL_5_SEC"
  #     flow_sampling        = 0.5
  #     metadata             = "INCLUDE_ALL_METADATA"
  #   }
  # }
}