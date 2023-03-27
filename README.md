# Template for Django Application
[![Python Version](https://img.shields.io/badge/python-3.10-blue)](https://www.python.org/downloads/)
[![Poetry Version](https://img.shields.io/badge/poetry-1.4.0-blue)](https://python-poetry.org/docs/)
[![Docker Version](https://img.shields.io/badge/docker-23.0.1-blue)](https://www.docker.com/)
[![Django Version](https://img.shields.io/badge/django-4.1.7-blue)](https://docs.djangoproject.com/en/4.1/)
[![DRF Version](https://img.shields.io/badge/djangorestframework-3.14.0-blue)](https://www.django-rest-framework.org/)
[![Pre-commit Version](https://img.shields.io/badge/precommit-3.2.0-blue)](https://pre-commit.com/)
[![Flake8 Version](https://img.shields.io/badge/falke8-6.0.0-blue)](https://flake8.pycqa.org/en/latest/)
[![Code style: black](https://img.shields.io/badge/code%20style-black-000000.svg)](https://github.com/psf/black)

## Setup
The first thing to do is to clone the repository:

```sh
$ git clone https://github.com/monkdok/django-template/
$ cd django_template
```

### Environment Variables
This project uses environment variables for sensitive information, such as database \
credentials and secret keys, etc.\
There are two types of environments: development and production.\
There is .env.example file within "docker" folder

For development, create a .env.dev file in the docker/.env/ directory and set \
variables using example docker/.env/.env.dev.example.
```sh
$ touch docker/.env/.env.dev
```

For production, create a .env.prod file in the docker/.env/ directory and set \
variables using example docker/.env/.env.prod.example.
```sh
$ touch docker/.env/.env.prod
```

## Docker
Once .env files are configured override docker/override/docker-compose.override.yml:\
dev:
```sh
$ make override_dev
```
prod:
```sh
$ make override_prod
```
Then you can run:
```sh
$ make up
```
And navigate to ` http://localhost:8000`.

## Pre-commit hooks

There are several pre-commit hooks configured for this repository. To install them do the following:


```bash
# Install all hooks defined at .pre-commit-config.yaml
pre-commit install --install-hooks

# Try our this command to run hooks manually
pre-commit run --all
```

This hooks will be executed automatically each time you execute the `git commit` commit. \
If any hook will fail you won't be able to commit your changes.

To skip all pre-commit hooks run `git commit --no-verify`.


## Tests

To run the tests docker compose service "web" must be running:
```sh
$ make test
```
