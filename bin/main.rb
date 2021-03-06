#!/usr/bin/env ruby
require_relative '../lib/telegram/bot'
require_relative '../lib/jokes'
require_relative '../lib/messages'

puts 'Chat whit the bot here:'
puts 'https://web.telegram.org/#/im?p=@jessibot_bot'
def background_run_at(time, message)
  fork do
    puts "Daily inspirational quote programmed at #{time}hr"
    sleep(1) until Time.now.strftime('%R') == Time.new.strftime(time.to_s)
    send_answer(message)
  end
end

def send_answer(message)
  token = '1261117312:AAFT9RGr5Dp-yhjdGD4yq7u_eTl45o2lQow'
  Telegram::Bot::Client.run(token) do |bot|
    bot.api.send_message(chat_id: message.chat.id, text: DailyQuotes.request_quote.to_s)
    puts 'The daily inspirational quote is already sended'
    sleep(60)
    form_response_again(message)
  end
end

def form_response_again(message)
  @num = message.text[7, 12]
  if @num.nil?
    @str = 'Sorry I do not understand...'
  else
    background_run_at(@num, message)
    puts "The next daily quote will send at #{@num} hr"
    @str = "You will receive your daily quotes at #{@num[0, 2]} hrs and #{@num[3, 5]} min"
  end
  @str
end

def form_response_set(message)
  @num = message.text[7, 12]
  if @num.nil? || (@num.length < 5)
    @str = 'Sorry I do not understand try to use this format :/daily 21:30'
  else
    background_run_at(@num, message)
    @str = "You will receive your daily quotes at #{@num[0, 2]} hrs and #{@num[3, 5]} min"
  end
  @str
end

token = '1261117312:AAFT9RGr5Dp-yhjdGD4yq7u_eTl45o2lQow'
Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    begin
      @keyword = message.text[%r{/([a-zA-Z]+)}]
    rescue StandardError => e
      log.fatal(e)
      log.fatal(message.text)
    else
      case @keyword
      when '/daily'
        @reply = form_response_set(message)
        bot.api.send_message(chat_id: message.chat.id, text: @reply)
      when '/stop'
        bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{message.from.first_name}")
      when '/end'
        bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{message.from.first_name}")
      end
      case message.text
      when '/start'
        bot.api.send_message(chat_id: message.chat.id, text: 'Hello, would you tell me you first name?')
      when '' + message.from.first_name.to_s + ''
        bot.api.send_message(chat_id: message.chat.id, text: "Hi #{message.from.first_name}, " + Jokes.request_joke)
      end
    end
  end
end
