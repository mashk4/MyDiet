# MyDiet

MyDiet is a web application that helps you count your calories and make diets. It tracks and calculates all the calories and nutrients in food during the day and then reports you all statistic via email. Create your own diet to control your daily calories to lose/gain weight! It works with the help of [CalorieNinjas](https://calorieninjas.com/) API.

## Requirements
This app uses following gems:
- [Devise](https://github.com/heartcombo/devise)
- [Sidekiq](https://github.com/mperham/sidekiq)

It also requires:
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
rails db:setup
```

4. Start Rails server

```bash
rails s
```
