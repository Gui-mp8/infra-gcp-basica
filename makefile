# Makefile

# Se não passar ENV na linha de comando, usa 'dev' por default
ENV ?= dev
BACKEND_BUCKET = infra-simples-terraform
BACKEND_PREFIX = infra-simples/$(ENV)

# Init já configura o backend correto
infra:
	@echo "=> Initializing Terraform (env=$(ENV))"
	TF_VAR_environment=$(ENV) terraform init \
	  -backend-config="bucket=$(BACKEND_BUCKET)" \
	  -backend-config="prefix=$(BACKEND_PREFIX)"

infra_plan:
	@echo "=> Planning Terraform (env=$(ENV))"
	TF_VAR_environment=$(ENV) terraform plan

infra_apply:
	@echo "=> Applying Terraform (env=$(ENV))"
	TF_VAR_environment=$(ENV) terraform apply -auto-approve

infra_destroy:
	@echo "=> Destroying Terraform (env=$(ENV))"
	TF_VAR_environment=$(ENV) terraform destroy -auto-approve
