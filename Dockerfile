FROM hexpm/elixir:1.15.6-erlang-26.1.1-alpine-3.18.2 AS base

# Install hex + rebar
RUN mix do local.hex, local.rebar --force

# Install build dependencies
RUN apk add --no-cache \
    build-base \
    git \
    nodejs \
    npm \
    python3 \
    yarn

FROM base as dev

EXPOSE 4000

FROM base AS build

# Install project dependencies
WORKDIR /app
COPY mix.exs mix.lock ./
COPY config config
RUN mix do deps.get, deps.compile

# build app
COPY . .
RUN mix do compile, release

FROM alpine-3.18.2 AS release

RUN apk add --no-cache \
    bash \
    openssl-dev

WORKDIR /app

COPY docker_entrypoint.sh ./
COPY --from=build /app/_build/prod/rel/elixir_app ./

CMD ["release"]
ENTRYPOINT ["docker_entrypoint.sh"]
