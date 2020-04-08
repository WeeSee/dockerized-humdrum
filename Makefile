#
# Humdrum usage tools
# WC, 2020
#

.PHONY: help build

help:
	@echo "# Humdrum usage tools"
	@echo "# (C) WCWS, 2020"
	@echo Befehle: make ...
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)
	@echo "eingestellt ist: $(DOCKER_COMPOSE_YML)"

.DEFAULT_GOAL := help

build: ## build images
	docker-compose build

up:	## start up cotainers
	docker-compose up -d --remove-orphans

down: ## stop and kill containers
	docker-compose down

bash: ## enter container with a bash
	docker-compose run app

