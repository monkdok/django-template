#!/bin/sh

# entrypoint.sh file of docker-compose file

wait_for_postgres() {
  if [ "$DATABASE" = "postgres" ]
  then
    echo "Waiting for PostgreSQL to start..."

    while ! nc -z "$SQL_HOST" "$SQL_PORT"; do
      sleep 0.1
    done

    echo "PostgreSQL started."
  fi
}

BackendProd ()
{
  wait_for_postgres
  make collectstatic
  make migrate
  make gunicorn
}
BackendDev ()
{
  wait_for_postgres
  make collectstatic
  make migrate
  make runserver
}

case $1
in
    backend_prod) BackendProd ;;
    backend_dev) BackendDev ;;
    *) exit 1 ;;
esac
