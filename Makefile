dev:
	docker compose -f docker-compose.dev.yml -p rinha-backend-elixir-dev up
dev-build:
	docker compose -f docker-compose.dev.yml -p rinha-backend-elixir-dev up --build
dev-exec:
	docker compose -p rinha-backend-elixir-dev exec app sh
release:
	docker compose up
release-build:
	docker compose up --build
release-exec:
	docker compose exec app sh
down:
	docker compose -p rinha-backend-elixir-dev down
	docker compose down
