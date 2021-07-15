### Installing (Not support Apple M1 chip)

##### Server Host: localhost:3008

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

### API

```sh
[GET] api/v1/products
Params:
int page (optional, defualt: 1),
int limit (optional, defualt: 10)

[POST] api/v1/products/fetch
Params:
string url (optional, defualt: 'https://www.mercular.com/computers-accessories/computer-monitors?min_price=&max_price=&attribute_option%5B%5D=PANEL_TYPE%2FIPS&attribute_option%5B%5D=MONITOR_SCREEN_SIZE%2F241t280&attribute_option%5B%5D=MONITOR_REFRESH_RATE%2F75Hz&attribute_option%5B%5D=MONITOR_REFRESH_RATE%2F144Hz'),
```
