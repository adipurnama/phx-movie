SHELL := /bin/bash

dev-server:
	mix phx.server

setup-tailwind:
	cd assets && rm ./css/phoenix.css && npx tailwindcss init \
		&& npm i -D tailwindcss postcss-loader postcss-import @fullhuman/postcss-purgecss
