require './lib/action'

RSpec.describe Action do
  describe '#Action list' do
    action = Action.new
    let(:mana_death) do
      {
        'dead' => false,
        'hp' => 100,
        'mana' => 101,
        'fun' => 10,
        'tiredness' => 5,
        'money' => 1000
      }
    end

    let(:tiredness_death) do
      {
        'dead' => false,
        'hp' => 100,
        'mana' => 10,
        'fun' => 10,
        'tiredness' => 500,
        'money' => 1000
      }
    end

    let(:fun_death) do
      {
        'dead' => false,
        'hp' => 100,
        'mana' => 10,
        'fun' => -110,
        'tiredness' => 50,
        'money' => 1000
      }
    end

    let(:hp_death) do
      {
        'dead' => false,
        'hp' => -100,
        'mana' => 10,
        'fun' => 10,
        'tiredness' => 50,
        'money' => 1000
      }
    end

    let(:no_work_condition) do
      {
        'dead' => false,
        'hp' => 100,
        'mana' => 60,
        'fun' => 10,
        'tiredness' => 5,
        'money' => 1000
      }
    end

    let(:money_condition) do
      {
        'dead' => false,
        'hp' => 100,
        'mana' => 60,
        'fun' => 10,
        'tiredness' => 5,
        'money' => 0
      }
    end

    let(:condition) do
      {
        'dead' => false,
        'hp' => 100,
        'mana' => 10,
        'fun' => 10,
        'tiredness' => 5,
        'money' => 1000
      }
    end

    let(:condition_for_metro) do
      {
        'dead' => false,
        'hp' => 100,
        'mana' => 50,
        'fun' => 10,
        'tiredness' => 5,
        'money' => 1000
      }
    end

    context 'Work test' do
      let(:expected) do
        {
          'dead' => false,
          'hp' => 100,
          'mana' => 0,
          'fun' => 5,
          'tiredness' => 75,
          'money' => 1100
        }
      end
      it { expect(action.work(condition.clone)).to eq expected }
    end

    context 'Can\'t work test' do
      let(:expected) do
        {
          'dead' => false,
          'hp' => 100,
          'mana' => 60,
          'fun' => 10,
          'tiredness' => 5,
          'money' => 1000
        }
      end
      it { expect(action.work(no_work_condition.clone)).to eq expected }
    end

    context 'Relax_in_nature test' do
      let(:expected) do
        {
          'dead' => false,
          'hp' => 100,
          'mana' => 0,
          'fun' => 0,
          'tiredness' => 15,
          'money' => 1000
        }
      end
      it { expect(action.relax_in_nature(condition.clone)).to eq expected }
    end

    context 'Rest test' do
      let(:expected) do
        {
          'dead' => false,
          'hp' => 95,
          'mana' => 40,
          'fun' => 9,
          'tiredness' => 15,
          'money' => 980
        }
      end
      it { expect(action.rest(condition.clone)).to eq expected }
    end

    context 'Can\'t rest test' do
      let(:expected) do
        {
          'dead' => false,
          'hp' => 100,
          'mana' => 60,
          'fun' => 10,
          'tiredness' => 5,
          'money' => 0
        }
      end
      it { expect(action.rest(money_condition.clone)).to eq expected }
    end

    context 'Go_to_bar test' do
      let(:expected) do
        {
          'dead' => false,
          'hp' => 90,
          'mana' => 70,
          'fun' => 0,
          'tiredness' => 45,
          'money' => 900
        }
      end
      it { expect(action.go_to_bar(condition.clone)).to eq expected }
    end

    context 'Can\'t go_to_bar test' do
      let(:expected) do
        {
          'dead' => false,
          'hp' => 100,
          'mana' => 60,
          'fun' => 10,
          'tiredness' => 5,
          'money' => 0
        }
      end
      it { expect(action.go_to_bar(money_condition.clone)).to eq expected }
    end

    context 'Drink_a_lot test' do
      let(:expected) do
        {
          'dead' => false,
          'hp' => 20,
          'mana' => 100,
          'fun' => 0,
          'tiredness' => 85,
          'money' => 850
        }
      end
      it { expect(action.drink_a_lot(condition.clone)).to eq expected }
    end

    context 'Can\'t drink_a_lot test' do
      let(:expected) do
        {
          'dead' => false,
          'hp' => 100,
          'mana' => 60,
          'fun' => 10,
          'tiredness' => 5,
          'money' => 0
        }
      end
      it { expect(action.drink_a_lot(money_condition.clone)).to eq expected }
    end

    context 'Sing_in_metro test out alco range' do
      let(:expected) do
        {
          'dead' => false,
          'hp' => 100,
          'mana' => 20,
          'fun' => 0,
          'tiredness' => 25,
          'money' => 1010
        }
      end
      it { expect(action.sing_in_metro(condition.clone)).to eq expected }
    end

    context 'Sing_in_metro test in alco range' do
      let(:expected) do
        {
          'dead' => false,
          'hp' => 100,
          'mana' => 60,
          'fun' => 0,
          'tiredness' => 25,
          'money' => 1060
        }
      end
      it { expect(action.sing_in_metro(condition_for_metro.clone)).to eq expected }
    end

    context 'Go_to_sleep test' do
      let(:expected) do
        {
          'dead' => false,
          'hp' => 100,
          'mana' => 0,
          'fun' => 10,
          'tiredness' => 0,
          'money' => 1000
        }
      end
      it { expect(action.go_to_sleep(condition.clone)).to eq expected }
    end

    context 'Mana_death' do
      expected = true
      it { expect(Valera.check_valera_death(mana_death.clone)).to eq expected }
    end

    context 'Tiredness_death' do
      expected = true
      it { expect(Valera.check_valera_death(tiredness_death.clone)).to eq expected }
    end

    context 'Fun_death' do
      expected = true
      it { expect(Valera.check_valera_death(fun_death.clone)).to eq expected }
    end

    context 'Hp_death' do
      expected = true
      it { expect(Valera.check_valera_death(hp_death.clone)).to eq expected }
    end
  end
end
