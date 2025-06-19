setup:
	yarn
	bin/setup

dev:
	overmind start

seed:
	overmind run bundle exec rails db:seed

admin:
	overmind run bundle exec rails g trek:admin:user

lint:
	bundle exec rubocop
	bundle exec slim-lint app/**/*.slim
	yarn eslint "app/**/*.js"
	yarn stylelint "app/**/*.css"
	yarn prettier --check "{app,config,lib,spec}/**/*.{css,js,json,md,yml}"

fix:
	bundle exec rubocop --autocorrect
	yarn eslint "app/**/*.js" --fix
	yarn stylelint "app/**/*.css" --fix
	yarn prettier --write "{app,config,lib,spec}/**/*.{css,js,json,md,yml}"

scan:
	bundle exec brakeman
	bundle exec bundle-audit check --update
	bundle exec ruby-audit check

test:
	overmind run bundle exec rails spec
spec: test
