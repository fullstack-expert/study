build:
	docker-compose build
	docker-compose run --rm ruby bash -c 'bundle install'

lint:
	docker-compose run --rm ruby bash -c 'bundle exec rubocop'

test:
	docker-compose run --rm ruby bash -c 'bundle exec rake test'

.PHONY: test