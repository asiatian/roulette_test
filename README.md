# Roulette

This is a test program.

## Requirements

*Ruby 3.0.0
*Rails 6.1.3.2
*Redis (Redis server needs to be active)
*React(not used)
*sqlite

## Installation

Have all the requirements installed and clone the repository.

Install the gems and create the database

```
$ bundle install
$ rails db:setup
$ rails db:migrate
$ npm install
$ whenever --update-crontab
$ whenever --update-crontab --set environment='development' (in case of development)
$ rails s -e production
$ rails s (in case of development)
```
