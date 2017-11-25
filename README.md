# PhxAuthApi

## Features

This project implements [`Guardian`](https://github.com/ueberauth/guardian) for ```JWT``` authentication and [`Canary`](https://github.com/cpjk/canary) for user specific authorization. The ```JWT``` token controls access to a certain endpoint and then ```Canary``` is used to figure out if the resource from the ```JWT``` has access to that endpoint. This makes this setup very dynamic for many authentication purposes.

[`CircleCI`](https://circleci.com/) test and deployment of master to [`Heroku`](https://heroku.com/)  is also implemented.

## Endpoints

All endpoints have ```Content-Type: application/json``` in the header

| URL            | METHOD       | HEADER | BODY                                                                   |
| -------------- | ------------ | ------ | ---------------------------------------------------------------------- |
| /api/login     | ```POST```   | none   | ```{ "user": { "username": "", "password": "" } }```                   |
| /api/users     | ```GET```    | none   | ```{ "user": { "username": "", "password": "" } }```                   |
| /api/users     | ```POST```   | none   | ```{ "user": { "username": "", "password": "" } }```                   |
| /api/users/:id | ```PUT```    | ```authorization: jwt``` | ```{ "user": { "username": "", "password": "" } }``` |
| /api/users/:id | ```DELETE``` | ```authorization: jwt``` | ```{ "user": { "username": "", "password": "" } }``` |

## Installation
  * Clone repo by ```git clone https://github.com/rootkc/phx-auth-api```
  * go to directory with ```cd phx-auth-api```
  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000/api/users`](http://localhost:4000/api/users) from your browser to fetch all users.
