#main.tf

provider "google" {
  credentials = file("infra-simples.json")
  project = local.config.project_id
  region  = local.config.region
}

module "project-services" {
  source                      = "terraform-google-modules/project-factory/google//modules/project_services"
  version                     = "18.0.0"
  disable_services_on_destroy = false

  project_id  = local.config.project_id
  enable_apis = true

  activate_apis = [
    "cloudresourcemanager.googleapis.com",
    "serviceusage.googleapis.com",
    "iam.googleapis.com",
    "cloudbuild.googleapis.com",
    "servicemanagement.googleapis.com",
  ]
}

module "vpc" {
  source           = "./modules/vpc"
  project_id       = local.config.project_id
  vpc_name         = local.config.vpc_name
  region           = local.config.region
  # enable_flow_logs = var.enable_flow_logs
}

# module "iam" {
#   source     = "../../modules/iam"
#   project_id = var.project_id
# }

# module "logging" {
#   source     = "../../modules/logging"
#   project_id = var.project_id
# }
