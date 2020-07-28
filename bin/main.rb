#!/usr/bin/env ruby
require './lib/telegram/bot'
require './lib/Jokes'
require './lib/Messages'
require './lib/Quotes'

p DailyQuotes.request_quote
token = '1261117312:AAFT9RGr5Dp-yhjdGD4yq7u_eTl45o2lQow'


Telegram::Bot::Client.run(token) do |bot|
  #bot.api.send_message(chat_id: 1290445462, text: "Hi") if (time.eql?(time2))
  bot.listen do |message|

    case message.text
    when '/end'
      bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{message.from.first_name}")
    when '/start'
      bot.api.send_message(chat_id: message.chat.id, text: "Hello, would you tell me you first name?")
    when ""+message.from.first_name.to_s+""
      bot.api.send_message(chat_id: message.chat.id, text: "Hi #{message.from.first_name}, "+ Jokes.request_joke)
    end
  end
end
