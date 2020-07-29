RSpec.describe Telegram::Bot::Exceptions::ResponseError do
  subject do
    begin
      described_class.new(response)
    rescue StandardError => e
      e
    end
  end

  let(:response) { Telegram::Bot::Api.new('123456:wrongtoken').call('getMe') }

  it 'verifying error in response' do
    is_expected.to respond_to(:error_code)
  end
end
