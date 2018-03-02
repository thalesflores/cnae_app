# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
  - 2.5.0

* System dependencies
  - Sqlite for development environment
  - Postgresql for production environment
  - Rails 5.1.5

* Configuration
  - `bundle install` for installing gems before use for the first time
  - It's necessary to declare your locals variables, based on the .env.development.sample
  - To generate TOKEN is necessary run in `IRB` or `rails console` the following code ```SecureRandom.uuid```

* Database creation
  - ```bundle exec rails db:create db:migrate```

* Database initialization
  - `bundle exec rails db:seed`
* How to run the test suite
  `bundle exec rspec`

* Endpoints usage
  - To select all transactions in database you must run `https://cnae-api.herokuapp.com/api/v1/cnaes` passing TOKEN in header
  - In the select endpoint is possible to pass the following filters `type, value, cpf and card`. Those filters could be passed like this `https://cnae-api.herokuapp.com/api/v1/cnaes?type=credit`
  - The current token to use the api is -> `410fe68f-63c0-4a86-b195-28a5bbd521a2`
  - You also can see full documentation in path public/api/v1/
