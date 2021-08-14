compose-setup:
	docker-compose build
	docker-compose run --rm ruby bash -c 'bundle install'

compose-test:
	docker-compose run --rm ruby bash -c 'bundle exec rake test'

compose-lint:
	docker-compose run --rm ruby bash -c 'bundle exec rubocop'

test:
	bundle exec rake test

lint:
	bundle exec rubocop

.PHONY: test
