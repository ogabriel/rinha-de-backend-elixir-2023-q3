#!/bin/sh

if [ "$1" = 'mix' ]; then
    cd /app
    mix do deps.get, deps.compile
    mix do ecto.create, ecto.migrate
    exec mix "$2"
elif [ "$1" = 'release' ]; then
    make database-check
    exec /app/bin/rinha start
elif [ "$1" = 'migrate_and_release' ]; then
    make database-check
    /app/bin/rinha eval "Rinha.Release.drop_database()"
    /app/bin/rinha eval "Rinha.Release.setup_database()"
    exec /app/bin/rinha start
fi
