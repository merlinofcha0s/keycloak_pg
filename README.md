# Keycloak PostgreSQL

Extends the Keycloak docker image to use PostgreSQL [jboss-dockerfiles/keycloak] (https://github.com/jboss-dockerfiles/keycloak/tree/master/server-postgres)

Little addons, the server is configured to redirect to port 443.

You just have to put an nginx or apache in front of keycloak to have https

## Usage

### Start a PostgreSQL instance

First start a PostgreSQL instance using the PostgreSQL docker image:

    docker run --name postgres -e POSTGRES_DATABASE=keycloak -e POSTGRES_USER=keycloak -e POSTGRES_PASSWORD=password -e POSTGRES_ROOT_PASSWORD=root_password -d postgres

### Start a Keycloak instance

Start a Keycloak instance and connect to the PostgreSQL instance:

    docker run --name keycloak --link postgres:postgres jboss/keycloak-postgres

### Environment variables

When starting the Keycloak instance you can pass a number of environment variables to configure how it connects to PostgreSQL. For example:

    docker run --name keycloak --link postgres:postgres -e POSTGRES_DATABASE=keycloak -e POSTGRES_USER=keycloak -e POSTGRES_PASSWORD=password jboss/keycloak-postgres

#### POSTGRES_DATABASE

Specify name of PostgreSQL database (optional, default is `keycloak`).

#### POSTGRES_USER

Specify user for PostgreSQL database (optional, default is `keycloak`).

#### POSTGRES_PASSWORD

Specify password for PostgreSQL database (optional, default is `keycloak`).
