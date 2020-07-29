RSpec.describe Telegram::Bot::Client do
  let(:token)  { '1261117312:AAFT9RGr5Dp-yhjdGD4yq7u_eTl45o2lQow' }
  let(:client) { described_class.new(token, options) }

  describe '#new' do
    subject { client.options }

    context 'with any options' do
      let(:options) do
        {
          offset: 1,
          timeout: 30,
          something: true
        }
      end

      it 'accepts any option' do
        is_expected.to eql(options)
      end
    end

    context 'with logger option' do
      let(:options) do
        {
          offset: 1,
          timeout: 30,
          something: true,
          logger: Logger.new('/dev/null')
        }
      end

      it 'removes logger from options' do
        is_expected.not_to include(:logger)
      end
    end
  end
end
