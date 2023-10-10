USER_ID = $(shell id -u)
GROUP_ID = $(shell id -g)

dev:
	USER_ID=$(USER_ID) GROUP_ID=$(GROUP_ID) docker compose -f docker-compose.dev.yml -p rinha-backend-elixir-dev up
dev-build:
	USER_ID=$(USER_ID) GROUP_ID=$(GROUP_ID) docker compose -f docker-compose.dev.yml -p rinha-backend-elixir-dev up --build
dev-exec:
	docker compose -p rinha-backend-elixir-dev exec app sh
release:
	docker compose up
release-build:
	docker compose up --build
release-exec:
	docker compose exec app sh
release-volume-delete:
	docker volume rm rinha-backend-elixir_postgres-data
release-volume-remove:
	docker volume rm rinha-backend-elixir_postgres-data
down:
	docker compose -p rinha-backend-elixir-dev down
	docker compose down
