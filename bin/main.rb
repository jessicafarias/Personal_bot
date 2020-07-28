require './lib/telegram/bot'

token = '1261117312:AAFT9RGr5Dp-yhjdGD4yq7u_eTl45o2lQow'
time = Time.now.strftime('%R')
time2 = Time.new.strftime('22:32')
p time.eql?(time2)
#Crono.perform(YourJob).every 1.day, at: {hour: 8, min: 00}
#class TestJob
#    def perform
#        p "WSD"
#    end
#end
#129044546

Telegram::Bot::Client.run(token) do |bot|
  bot.api.send_message(chat_id: 1290445462, text: "Se supone que son las9") if (time.eql?(time2))
  bot.listen do |message|

    case message.text
    when 'Hi'
      kb = [
        Telegram::Bot::Types::KeyboardButton.new(text: 'Give me your phone number', request_contact: true),
        Telegram::Bot::Types::KeyboardButton.new(text: 'Show me your location', request_location: true)
      ]
      markup = Telegram::Bot::Types::ReplyKeyboardMarkup.new(keyboard: kb)
      bot.api.send_message(chat_id: message.chat.id, text: 'Hey!', reply_markup: markup)
    when '/stop'
      bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{message.from.first_name}")
    when 'Quiero ordenar un panini'
      question = 'El panini'
      answers =
        Telegram::Bot::Types::ReplyKeyboardMarkup
          .new(keyboard: [%w[Tradicional Veggie&Goth], %w[3 Quesos Elotro]], one_time_keyboard: true)
      bot.api.send_message(chat_id: message.chat.id, text: question, reply_markup: answers)
    end
  end

  while message.class != Telegram::Bot::Types::Message do
    p "shil"
      var.api.send_message(chat_id: 1290445462, text: "Se supone que son las 10") if (time.eql?(time2))
  end

  # if(DateTime.)
  #   bot.api.send_message(chat_id: message.chat_id, text: "Le recordamos que estas todo feo"
end
