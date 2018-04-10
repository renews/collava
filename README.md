[![Build Status](https://semaphoreci.com/api/v1/renews/collava/branches/master/badge.svg)](https://semaphoreci.com/renews/collava)

# collava
Collava is a web application to aggregate daily things you found around the web.

## Stack
* Vue
* Phoenix
* GraphQL
* Docker/DockerCompose
* Rethinkdb
```
docker run -p 8080:8080 -p 28015:28015 -p 29015:29015 --name dev-rethinkdb -d rethinkdb:latest
```
