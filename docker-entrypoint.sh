#!/bin/sh

if [ "$1" = 'mix' ]; then
    cd /app
    mix do deps.get, deps.compile
    mix do ecto.create, ecto.migrate
    exec mix "$2"
elif [ "$1" = 'release' ]; then
    exec ./rel/elixir_app/bin/elixir_app start
fi
