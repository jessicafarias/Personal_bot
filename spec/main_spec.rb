require '../lib/jokes'
require '../lib/messages'

describe Jokes do
  describe '#jockes' do
    it 'request joke is a string' do
      expect(Jokes.request_joke.class).to eql("string".class)
    end
    it 'initialize testing' do
        var = DailyQuotes.new(1)
        expect(var.id).to eql(1)
    end
  end
  describe '#dailyquotes' do
    it 'request quote is a string' do
        expect(DailyQuotes.request_quote.class).to eql("string".class)
    end
    it 'initialize testing' do
        var = DailyQuotes.new(1)
        expect(var.id).to eql(1)
    end
  end
end