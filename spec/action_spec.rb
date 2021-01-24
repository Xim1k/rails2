require './lib/action'

RSpec.describe Action do
  describe 'Action list' do
    let(:condition) do
      {
        'hp' => 100,
        'mana' => 10,
        'fun' => 10,
        'tiredness' => 5,
        'money' => 1000
      }
    end

    context 'work' do
      let(:expected) do
        {
          'hp' => 100,
          'mana' => -20,
          'fun' => 5,
          'tiredness' => 75,
          'money' => 1100
        }
      end
      it { expect(Action.work(condition.clone)).to eq expected }
    end

    context 'relax_in_nature' do
      let(:expected) do
        {
          'hp' => 100,
          'mana' => 0,
          'fun' => 11,
          'tiredness' => 15,
          'money' => 1000
        }
      end
      it { expect(Action.relax_in_nature(condition.clone)).to eq expected }
    end

    context 'rest' do
      let(:expected) do
        {
          'hp' => 95,
          'mana' => 40,
          'fun' => 9,
          'tiredness' => 15,
          'money' => 980
        }
      end
      it { expect(Action.rest(condition.clone)).to eq expected }
    end

    context 'go_to_bar' do
      let(:expected) do
        {
          'hp' => 90,
          'mana' => 70,
          'fun' => 11,
          'tiredness' => 45,
          'money' => 900
        }
      end
      it { expect(Action.go_to_bar(condition.clone)).to eq expected }
    end

    context 'go_to_bar' do
      let(:expected) do
        {
          'hp' => 90,
          'mana' => 70,
          'fun' => 11,
          'tiredness' => 45,
          'money' => 900
        }
      end
      it { expect(Action.go_to_bar(condition.clone)).to eq expected }
    end

    context 'drink_a_lot' do
      let(:expected) do
        {
          'hp' => 20,
          'mana' => 100,
          'fun' => 15,
          'tiredness' => 85,
          'money' => 850
        }
      end
      it { expect(Action.drink_a_lot(condition.clone)).to eq expected }
    end

    context 'sing_in_metro' do
      let(:expected) do
        {
          'hp' => 100,
          'mana' => 20,
          'fun' => 11,
          'tiredness' => 25,
          'money' => 1010
        }
      end
      it { expect(Action.sing_in_metro(condition.clone)).to eq expected }
    end

    context 'go_to_sleep' do
      let(:expected) do
        {
          'hp' => 190,
          'mana' => -40,
          'fun' => 10,
          'tiredness' => -65,
          'money' => 1000
        }
      end
      it { expect(Action.go_to_sleep(condition.clone)).to eq expected }
    end

    context 'check_mana' do
      value = 10
      expected = true
      it { expect(Action.check_mana(value.clone)).to eq expected }
    end

    context 'check_mana' do
      value = 0
      expected = true
      it { expect(Action.check_mana(value.clone)).to eq expected }
    end

    context 'check_mana' do
      value = 100
      expected = true
      it { expect(Action.check_mana(value.clone)).to eq expected }
    end

    context 'check_mana' do
      value = -100
      expected = false
      it { expect(Action.check_mana(value.clone)).to eq expected }
    end

    context 'check_fun' do
      value = 10
      expected = true
      it { expect(Action.check_fun(value.clone)).to eq expected }
    end

    context 'check_fun' do
      value = -10
      expected = true
      it { expect(Action.check_fun(value.clone)).to eq expected }
    end

    context 'check_fun' do
      value = 5
      expected = true
      it { expect(Action.check_fun(value.clone)).to eq expected }
    end

    context 'check_fun' do
      value = 100
      expected = false
      it { expect(Action.check_fun(value.clone)).to eq expected }
    end

    context 'check_tire' do
      value = 0
      expected = true
      it { expect(Action.check_tire(value.clone)).to eq expected }
    end

    context 'check_tire' do
      value = 100
      expected = true
      it { expect(Action.check_tire(value.clone)).to eq expected }
    end

    context 'check_tire' do
      value = 50
      expected = true
      it { expect(Action.check_tire(value.clone)).to eq expected }
    end

    context 'check_tire' do
      value = 1000
      expected = false
      it { expect(Action.check_tire(value.clone)).to eq expected }
    end

    context 'check_money' do
      value = 0
      expected = true
      it { expect(Action.check_money(value.clone)).to eq expected }
    end

    context 'check_money' do
      value = 50
      expected = true
      it { expect(Action.check_money(value.clone)).to eq expected }
    end

    context 'check_money' do
      value = -100
      expected = false
      it { expect(Action.check_money(value.clone)).to eq expected }
    end
  end
end
