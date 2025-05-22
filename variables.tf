#variables.tf

variable "environment" {
  description = "Ambiente de deploy: deve ser 'dev' ou 'prd'"
  type        = string
  validation {
    condition     = var.environment == "dev" || var.environment == "prd"
    error_message = "environment deve ser 'dev' ou 'prd'."
  }
}

variable "project_id" {
  description = "ID do projeto"
  type        = string
}

variable "region" {
  description = "Região"
  type        = string
  default     = "us-central1"
}

variable "vpc_name" {
  description = "Nome da VPC"
  type        = string
}

# variable "enable_flow_logs" {
#   type    = bool
#   default = false
# }