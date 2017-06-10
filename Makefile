build:
	docker-compose build

start-db:
	docker-compose up -d postgresql

init-db: start-db
	sleep 10
	docker-compose exec postgresql dropdb -U musicbrainz musicbrainz

create-db: init-db
	docker-compose run --rm musicbrainz /createdb.sh

fetch-db: init-db
	docker-compose run --rm musicbrainz /createdb.sh -fetch
