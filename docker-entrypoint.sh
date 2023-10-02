#!/bin/sh

if [ "$1" = 'mix' ]; then
    cd /app
    mix do deps.get, deps.compile
    mix do ecto.create, ecto.migrate
    exec mix "$2"
elif [ "$1" = 'release' ]; then
    sleep 5
    /app/bin/rinha eval "Rinha.Release.setup_database()"
    exec /app/bin/rinha start
fi
