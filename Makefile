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
	make down
	docker volume rm $(PROJECT)_postgres-data || exit 0
	docker compose up --build
release-exec:
	docker compose exec app sh

nginx-build:
	make down
	docker volume rm $(PROJECT)-nginx_postgres-data || exit 0
	docker compose -f docker-compose.nginx.yml -p $(PROJECT)-nginx up --build
down:
	docker stop postgres-11
	docker stop postgres
	docker compose -p $(PROJECT)-dev down
	docker compose -p $(PROJECT)-nginx down
	docker compose down
