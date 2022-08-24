# MyDiet

MyDiet is a web application that helps you count your calories and make diets. You provide the meals and foods you have eaten during the day, and MyDiet tracks and calculates all the calories and nutrients in your food.

## Dependencies
This app uses such gems:
- [Devise](https://github.com/heartcombo/devise)
- [Sidekiq](https://github.com/mperham/sidekiq)
- [Sidekiq-cron](https://github.com/ondrejbartas/sidekiq-cron)

## Installation
The setups steps expect following tools installed on the system:

- Git
- Ruby 3.1.2
- Rails 7.0.3

### Set up Rails app
1. Clone MyDiet:

```bash
git clone https://github.com/mashk4/MyDiet
cd MyDiet
```

2. Install the gems required by the application:

```bash
bundle
```

3. Next, execute the database migrations/schema setup:

```bash
bundle exec rails db:setup
```

4. Start Rails server

```bash
rails s
```