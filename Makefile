build:
	docker-compose build
	docker-compose run --rm ruby bash -c 'bundle install'

test:
	docker-compose run --rm ruby bash -c 'bundle exec rake test'

.PHONY: test