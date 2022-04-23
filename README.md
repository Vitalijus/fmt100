# README


## Getting Started

These instructions will get you a copy of the project up and running on your
local machine for development and testing purposes.

# Prerequisites

- Install [Ruby](https://www.ruby-lang.org/en/downloads/) 2.6.7.
- Install [Docker](https://www.docker.com/).
- Clone https://github.com/Vitalijus/fmt100.git
- ...

# Docker commands

With your services running, you can visit localhost:3000 or http://your_server_ip:3000 in the browser.

Run below command to create container for fmt100, DB, Redis and Sidekiq. -d flag run the containers in the background.

```sh
docker-compose up -d
```

Stops containers and removes containers, networks, volumes, and images created by up. After this command would need to create/reset DB, all data would be lost.

```sh
docker-compose down
```

Get more detailed information about the startup processes by displaying the log output:

```sh
docker-compose logs
```

Check the status of your containers with:

```sh
docker-compose ps
```

Run migrations on it with the following:

```sh
docker-compose exec app rake db:migrate
```

Open the Rails console on the app container:

```sh
docker-compose exec app rails console
```

Resets your database using your migrations for the current environment. It does this by running the db:drop, db:create, db:migrate tasks. Below command will erase your current DB.

```sh
docker-compose exec app rake db:reset
```
