#!/bin/sh

echo "Running migrations"
npx prisma migrate deploy

echo "Generating Prisma client"
npx prisma generate

echo "Starting map ui"
exec node src/index.js ${MAP_OPTS}