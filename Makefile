SHELL := /bin/bash

dev-server:
	mix phx.server

setup-tailwind:
	cd assets && rm ./css/phoenix.css && npx tailwindcss init \
		&& npm i -D tailwindcss postcss-loader postcss-import @fullhuman/postcss-purgecss

release:
	MIX_ENV=prod mix release

release-run:
	MIX_ENV=prod PORT=4000 _build/prod/rel/movie/bin/movie start
