USER_ID = $(shell id -u)
GROUP_ID = $(shell id -g)
DEV_PROJECT=$(shell pwd)-dev
RELEASE_PROJECT=$(shell pwd)

dev:
	USER_ID=$(USER_ID) GROUP_ID=$(GROUP_ID) docker compose -f docker-compose.dev.yml -p $(DEV_PROJECT) up
dev-build:
	USER_ID=$(USER_ID) GROUP_ID=$(GROUP_ID) docker compose -f docker-compose.dev.yml -p $(DEV_PROJECT) up --build
dev-exec:
	docker compose -p $(DEV_PROJECT) exec app sh
dev-volume-remove:
	docker volume rm $(DEV_PROJECT)_postgres-data
release:
	docker compose up
release-build:
	docker compose down
	docker volume rm $(RELEASE_PROJECT)_postgres-data || 0
	docker compose up --build
release-exec:
	docker compose exec app sh
down:
	docker compose -p $(DEV_PROJECT) down
	docker compose down
