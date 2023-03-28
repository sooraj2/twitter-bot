# Twitter Bot - Rails
This project is a Twitter bot built on rails using twitter gem.

### Features
- Users can ask the time from bot and the bot will reply with the current time on their tweet.

### Assumptions
- Users Bot command can be customized, by default it is listening to **@bot what is the time**

## Project structure

| Name                          | Description                               |
| ------------------------------|------------------------------------------ |
| app/services                  | Logic for parsing tweets and replying     |
| app/sidekiq                   | background jobs that gets scheduled       |


### DEPENDENCIES
- Ruby 3.0.4
- Rails 7.0.4

## PROJECT SETUP

### Install required dependencies
This project was built using Ruby on Rails, it has a variety of dependencies in the form of "ruby gems".
See ruby version in gemfile.

Once you have ruby installed, you will need the bundler gem. To install bundler, simply run:

```
gem install bundler
```

After bundler is installed, run the following command from the root directory of the application (you may need to install some dependencies):

```
bundle install
```

Amazing! Now all of those sweet packages we use to make this application work should be installed.

### Define the following environment variables in .env file on root level

```
TWITTER_API_KEY
TWITTER_API_SECRET
TWITTER_ACCESS_TOKEN
TWITTER_ACCESS_TOKEN_SECRET
BOT_NAME
BOT_COMMAND
```

Hurray! the project is ready to run.

### Utilities Used

```
Twitter
Sidekiq
Sidekiq Scheduler
Dot env
```
