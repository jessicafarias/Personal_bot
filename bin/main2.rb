require './lib/telegram/bot'


def background_run_at(time, message)
  fork do
    sleep(1) until Time.now >= time
    send_answer(message)
  end
end

def send_answer(message)
    token = '1261117312:AAFT9RGr5Dp-yhjdGD4yq7u_eTl45o2lQow'
    Telegram::Bot::Client.run(token) do |bot|
      bot.api.send_message(chat_id: message.chat.id, text: "The time has come")
    end
end


def form_response_set(message)
  @num = message.text[/\d+/]
  unless @num.nil? || @num == 0
    @now = Time.now
    @then = @now + @num.to_i
    background_run_at(@then, message)
    @str = "I'm starting to count..."
    # @str = sum([Time.now, 5])
  else
    @str = "Sorry I do not understand..."
  end
  return @str
end
token = '1261117312:AAFT9RGr5Dp-yhjdGD4yq7u_eTl45o2lQow'
Telegram::Bot::Client.run(token) do |bot|
  logger = Logger.new('logfile.log')
  bot.listen do |message|
    begin
    @keyword = message.text[/\/([a-zA-Z]+)/]
    rescue => err
      log.fatal(err)
      log.fatal(message.text)
    else
    case @keyword
      when '/start'
        bot.api.send_message(chat_id: message.chat.id, text: "Hello, #{message.from.first_name}")
      when '/set'
        @reply = form_response_set(message)
        bot.api.send_message(chat_id: message.chat.id, text: @reply)
      when '/stop'
        bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{message.from.first_name}")
    end
    end
  end
end