run:
	docker-compose build
	docker-compose run --rm ruby bash -c 'bundle install'

outtest:
	docker-compose run --rm ruby bash -c 'bundle exec rake test'

outlint:
	docker-compose run --rm ruby bash -c 'bundle exec rubocop'

shell:
	docker-compose run ruby bash

intest:
	bundle exec rake test

inlint:
	bundle exec rubocop