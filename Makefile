MANAGE := python3 app/manage.py

runserver:
	$(MANAGE) runserver 0.0.0.0:8000

makemigrations:
	$(MANAGE) makemigrations

migrate:
	$(MANAGE) migrate

collectstatic:
	$(MANAGE) collectstatic --noinput

createsuperuser:
	cd docker && docker compose exec web $(MANAGE) createsuperuser

shell:
	cd docker && docker compose exec -it web /bin/bash

override_prod:
	cp docker/override/docker-compose.override-prod.yml docker/docker-compose.override.yml

override_dev:
	cp docker/override/docker-compose.override-dev.yml docker/docker-compose.override.yml

up:
	cd docker && docker compose up --build --force-recreate

down:
	cd docker && docker compose down

gunicorn:
	cd app && gunicorn wsgi:application --bind 0.0.0.0:8000

test:
	cd docker && docker compose exec web $(MANAGE) test
