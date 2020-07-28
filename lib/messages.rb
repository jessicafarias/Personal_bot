class DailyQuotes
  @messages = { 0 => 'I ate a clock yesterday, it was very time-consuming.',
                1 => "Your limitation—it's only your imagination.",
                2 => 'Push yourself, because no one else is going to do it for you.',
                3 => 'Sometimes later becomes never...',
                4 => 'Great things never come from comfort zones',
                5 => "Success doesn't just find you. ..." }

  def initialize(id)
    @id = id
  end

  def self.request_quote
    @messages[rand(5)]
  end

  def self.create_quote(new_msj)
    @new = { @messages.length + 1 => '+' + new_msj.to_s + '+' }
    @messages.merge(@new)
  end
end
