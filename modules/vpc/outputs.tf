#vpc/output.tf

output "network_id" {
  description = "ID da VPC criada"
  value       = google_compute_network.vpc_network.id
}
output "subnet_id" {
  description = "ID da sub-rede criada"
  value       = google_compute_subnetwork.subnet.id
}