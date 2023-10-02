dev:
	docker compose -f docker-compose.dev.yml -p rinha-backend-elixir-dev up
dev-build:
	docker compose -f docker-compose.dev.yml -p rinha-backend-elixir-dev up --build
release:
	docker compose up
release-build:
	docker compose up --build
down:
	docker compose -f docker-compose.dev.yml -p rinha-backend-elixir-dev down
	docker compose down
