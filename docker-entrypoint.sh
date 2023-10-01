#!/bin/sh

mix do ecto.create, ecto.migrate
exec mix phx.server
