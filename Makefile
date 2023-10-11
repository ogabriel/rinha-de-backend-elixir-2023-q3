USER_ID = $(shell id -u)
GROUP_ID = $(shell id -g)
PROJECT=$(shell basename $(PWD))

dev:
	USER_ID=$(USER_ID) GROUP_ID=$(GROUP_ID) docker compose -f docker-compose.dev.yml -p $(PROJECT)-dev up
dev-build:
	USER_ID=$(USER_ID) GROUP_ID=$(GROUP_ID) docker compose -f docker-compose.dev.yml -p $(PROJECT)-dev up --build
dev-exec:
	docker compose -p $(PROJECT)-dev exec app sh
dev-volume-remove:
	docker volume rm $(PROJECT)-dev_postgres-data
release:
	docker compose up
release-build:
	docker compose down
	docker volume rm $(PROJECT)_postgres-data || exit 0
	docker compose up --build
release-exec:
	docker compose exec app sh
down:
	docker compose -p $(PROJECT)-dev down
	docker compose down
