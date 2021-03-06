# Telegram bot
This Ruby-based project (OOP). The purpose of this project is to program daily inspirational quotes via Telegram. It also sends jokes whenever the user writes their own name.

## Built With

- Ruby 2.7.0
- Rubocop
- Rspec
- telegram-bot-ruby library

## Getting Started

To get a local copy up and running follow these simple example steps.

1. Open the terminal comand line window
2. `git clone https://github.com/jessicafarias/Personal_bot.git`
3. Open the spec folder and run the personal bot
4. Enjoy!

## Installation

Add following line to your Gemfile:

```ruby
gem 'telegram-bot-ruby'
```

And then execute:

```shell
$ bundle
```

Or install it system-wide:

```shell
$ gem install telegram-bot-ruby
```

## RUN PERSONAL BOT

To inicialize the telegram bot just write the following command on the root folder.

```ruby 
bin/main.rb 
``` 

## Instructions
1. Open Telegram the program provides you the link of the bot
2. In the telegram chat clic on "start" and automaticly you will write "/start" and the bot will ask you for your name
3. Write your name to display a joke
4. Write "/daily 20:30" to programm a daily inspirational quote 8:30pm every day
5. Verify the terminal displaying messages of the modification made by the user.

## Screenshots
![screenshot](assets/images/screenshot2.jpeg)
![screenshot](assets/images/screenshot.jpeg)
![screenshot](assets/images/screenshot3.jpeg)


## RUN TEST

To run the Rspec and check for testing cases write the following command on the root folder.

```ruby 
rspec 
``` 

```shell
Telegram::Bot::Api
  #call
    returns hash
    has status
    has result
    when token is invalid
      testing an invalid token raises an error
  #method_missing
    responds to endpoints
    when method name is in snake case
      responds to snake-cased endpoints

Telegram::Bot::Client
  #new
    with any options
      accepts any option
    with logger option
      removes logger from options

Telegram::Bot::Exceptions::ResponseError
  verifying error in response

Telegram::Bot
  testing if telegram bot works

Jokes
  #jockes
    request joke is a string
    initialize testing
  #dailyquotes
    request quote is a string
    initialize testing
``` 
## Demo Links 

- [Bot Link](https://web.telegram.org/#/im?p=@jessibot_bot)
- [Youtube video](https://www.youtube.com/watch?v=DGkzwaXBn2k)

## Authors

👤 **Jessica Farias**

- Github: [jessicafarias](https://github.com/jessicafarias)
- Twitter: [@FariasRosado](https://twitter.com/FariasRosado)
- Linkedin: [jessica-michelle-farias-rosado](https://www.linkedin.com/in/jessica-michelle-farias-rosado/)


## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](issues/).

## Show your support

Give a ⭐️ if you like this project!

## 📝 License

This project is [MIT](LICENSE) licensed.
