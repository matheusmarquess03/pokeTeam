# POKE TEAM
Click here to visit: 

- You can register yours teams and shared with yours friends;
- You can see all teams of another trainers;

## Pre-requisites

**Recommend**
- Ruby ~> 2.6.3
- Rails ~> 5.2.1
- Postgres ~> 12.8

## Setup project
1. `$ git clone https://github.com/matheusmarquess03/pokeTeam.git`
1. `$ cd pokeTeam`
1. `$ Set your database configuration at config/database.yml`
1. `$ bundle install`
1. `$ rake db:create`
1. `$ rake db:migrate`
1. `$ rake db:seed`
1. `$ rails s`

Open in browser [http://localhost:3000](http://localhost:3000)

## Services

I create two services in a class `GetPokedex`:

1. First service get all pokemons from [pokeapi](https://pokeapi.co/) and sort by name and return results
2. Second service get one pokemon from [pokeapi](https://pokeapi.co/), receive a parameter what is name pokemon, and return result

## Run tests

1. `rspec spec/`

## Gems used
- [Devise](https://github.com/heartcombo/devise) for authetication
- [Pundit](https://github.com/varvet/pundit) for authorization
- [rest-client](https://github.com/rest-client/rest-client) for consume api

**tests**
- [database_cleaner](https://github.com/DatabaseCleaner/database_cleaner) to erase tests database
- [Factories](https://github.com/thoughtbot/factory_bot) to help with the tests
- [FFaker](https://github.com/ffaker/ffaker) to generate random faker
- [Rspec](https://github.com/rspec/rspec-rails) for tests
- [rubocop-rails](https://github.com/rubocop/rubocop) and [rubocop-performance](https://github.com/rubocop/rubocop-performance) for help me with good pratices :D
