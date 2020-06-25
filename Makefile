run:
	docker-compose build
	docker-compose run --rm ruby bash -c 'bundle install'

dctest:
	docker-compose run --rm ruby bash -c 'bundle exec rake test'

lint:
	docker-compose run --rm ruby bash -c 'bundle exec rubocop'