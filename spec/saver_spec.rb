require './lib/saver'
require './lib/loader'

RSpec.describe Saver do
  describe '#Saver' do
    context 'saver test' do
      saver = Saver.new
      valera = Valera.new
      loader = Loader.new
      let(:condition) do
        {
          'dead' => false,
          'hp' => 100,
          'mana' => 0,
          'fun' => 5,
          'tiredness' => 0,
          'money' => 20
        }
      end
      it {
        allow($stdin).to receive(:gets).and_return('OldRabbit')
        saver.saver(valera)
        expected = loader.loader(valera)
        expect(expected).to eq condition
      }
    end
  end
end
