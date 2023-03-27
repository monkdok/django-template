FROM python:3.10-slim-buster AS builder

# Set environment variables
ENV PYTHONFAULTHANDLER=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PYTHONHASHSEED=random \
    # poetry:
    POETRY_VERSION=1.4.0 \
    POETRY_VIRTUALENVS_CREATE=false \
    POETRY_CACHE_DIR='/var/cache/pypoetry'

# System deps:
RUN apt-get update \
  && apt-get install --no-install-recommends -y \
    bash \
    build-essential \
    curl \
    gettext \
    git \
    libpq-dev \
    wget \
  # Cleaning cache:
  && apt-get autoremove -y && apt-get clean -y && rm -rf /var/lib/apt/lists/* \
  && pip install "poetry==$POETRY_VERSION" && poetry --version

WORKDIR /django_app

COPY ./pyproject.toml .
RUN poetry install --no-root --no-dev

COPY . .

# Create required directories and set permissions
RUN mkdir -p /django_app/static /django_app/media && \
    chmod -R 775 /django_app/static /django_app/media && \
    chmod +x ./scripts/entrypoint.sh

FROM builder as production

RUN poetry install --only prod
