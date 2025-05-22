#locals.tf

locals {
  # Mapas de valores por ambiente
  project_map = {
    dev = "infra-simples-dev-458804"
    prd = "infra-simples-prd"
  }
  vpc_map = {
    dev = "vpc-dev"
    prd = "vpc-prd"
  }
  prefix_map = {
    dev = "dev"
    prd = "prd"
  }

  # Configuração final, escolhe do mapa, ou cai no var.* se for passado explicitamente
  config = {
    project_id = coalesce(var.project_id, lookup(local.project_map, var.environment, null))
    vpc_name   = coalesce(var.vpc_name,   lookup(local.vpc_map,     var.environment, null))
    prefix     = lookup(local.prefix_map, var.environment)
    region     = var.region
  }
}