### Installing

```sh
docker-compose up -d
```

### Create & Migration Database

```sh
#Into bash container
docker-compose run --rm app bash

# create database
rails db:create

# migration database
rails db:migrate
```

### Stop all services

```sh
docker-compose down
```
