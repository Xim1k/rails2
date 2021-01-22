class Action
  def self.work(condition)
    if (condition['mana'] < 50) && (condition['tiredness'] < 10)
      condition['fun'] -= 5
      condition['mana'] -= 30
      condition['money'] += 100
      condition['tiredness'] += 70
    end
    condition
  end

  def self.relax_in_nature(condition)
    condition['fun'] += 1
    condition['mana'] -= 10
    condition['tiredness'] += 10
    condition
  end

  def self.rest(condition)
    if condition['money'] >= 20
      condition['fun'] -= 1
      condition['mana'] += 30
      condition['tiredness'] += 10
      condition['hp'] -= 5
      condition['money'] -= 20
    end
    condition
  end

  def self.go_to_bar(condition)
    if condition['money'] >= 100
      condition['fun'] += 1
      condition['mana'] += 60
      condition['tiredness'] += 40
      condition['hp'] -= 10
      condition['money'] -= 100
    end
    condition
  end

  def self.drink_a_lot(condition)
    if condition['money'] >= 150
      condition['fun'] += 5
      condition['mana'] += 90
      condition['tiredness'] += 80
      condition['hp'] -= 80
      condition['money'] -= 150
    end
    condition
  end

  def self.sing_in_metro(condition)
    condition['money'] += 50 if (condition['mana'] > 40) && (condition['mana'] < 70)
    condition['fun'] += 1
    condition['mana'] += 10
    condition['tiredness'] += 20
    condition['money'] += 10
    condition
  end

  def self.go_to_sleep(condition)
    condition['hp'] += 90 if condition['mana'] < 30
    condition['fun'] -= 3 if condition['mana'] > 70
    condition['mana'] -= 50
    condition['tiredness'] -= 70
    condition
  end

  def self.check_mana(mana)
    mana.between?(0, 100)
  end

  def self.check_fun(fun)
    fun.between?(-10, 10)
  end

  def self.check_tire(tiredness)
    tiredness.between?(0, 100)
  end

  def self.check_money(money)
    money >= 0
  end

end
