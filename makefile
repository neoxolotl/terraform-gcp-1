export TF_VAR_project_id=$(project_id)
export TF_VAR_gcp_region=$(gcp_region)
init:
	@echo "Init step"
	@bash scripts/terraform.sh terraform_init

validate:
	@echo "Validate step"
	@bash scripts/terraform.sh terraform_validate

plan:
	@echo "Plan step"
	@bash scripts/terraform.sh terraform_plan

apply:
	@echo "Apply step"
	@bash scripts/terraform.sh terraform_apply

destroy:
	@echo "Destroy step"
	@bash scripts/terraform.sh terraform_destroy

output:
	@echo "Output step"
	@bash scripts/terraform.sh terraform_output

deploy-app:
	@echo "Deploy APP step"
	@bash scripts/deployapp.sh