# collava
Collava is a web application to aggregate daily things you found around the web.

## Stack
* Elm
```
npm -i install elm
cd assets
npm i elm-brunch --save-dev
cd elm
elm package install -y elm-lang/core
elm package install -y elm-lang/http
elm package install -y NoRedInk/elm-decode-pipeline
```
* Phoenix
* GraphQL
* Rethinkdb 
```
docker run -p 8080:8080 -p 28015:28015 -p 29015:29015 --name dev-rethinkdb -d rethinkdb:latest
```
