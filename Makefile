push_image_ecr:
	#aws ecr create-repository --repository-name dev-ecr/sales_grafana
	aws ecr get-login-password | docker login --username AWS --password-stdin 059692690036.dkr.ecr.eu-central-1.amazonaws.com/dev-ecr/sales_grafana
	docker tag sales_grafana:latest 059692690036.dkr.ecr.eu-central-1.amazonaws.com/dev-ecr/sales_grafana
	docker push 059692690036.dkr.ecr.eu-central-1.amazonaws.com/dev-ecr/sales_grafana

get_creds:
	terraform output -raw robot_account_id
