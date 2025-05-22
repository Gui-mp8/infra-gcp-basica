#vpc/variables.tf

variable "project_id" {
  type        = string
  description = "ID do projeto GCP"
}
variable "region" {
  type        = string
  description = "Região GCP onde ficará a sub-rede"
}
variable "vpc_name" {
  type        = string
  description = "Nome da VPC"
}

# variable "enable_flow_logs" {
#   description = "Ativa logs de fluxo de rede"
#   type        = bool
#   default     = false
# }