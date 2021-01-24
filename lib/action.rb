class Action
  def work(condition)
    if (condition['mana'] < 50) && (condition['tiredness'] < 10)
      condition['fun'] -= 5
      condition['mana'] -= 30
      condition['money'] += 100
      condition['tiredness'] += 70
    else
      puts("\nРаботать можно только если алкоголь < 50, усталость < 10")
    end
    condition
  end

  def relax_in_nature(condition)
    condition['fun'] += 1
    condition['mana'] -= 10
    condition['tiredness'] += 10
    condition
  end

  def rest(condition)
    if condition['money'] >= 20
      condition['fun'] -= 1
      condition['mana'] += 30
      condition['tiredness'] += 10
      condition['hp'] -= 5
      condition['money'] -= 20
    else
      puts("\nИзвини, ты не нашкреб на винишко(Нужно не менее 20$)")
    end
    condition
  end

  def go_to_bar(condition)
    if condition['money'] >= 100
      condition['fun'] += 1
      condition['mana'] += 60
      condition['tiredness'] += 40
      condition['hp'] -= 10
      condition['money'] -= 100
    else
      puts("\nВ бар без сотки? Пора на работу!(Нужно не менее 100$)")
    end
    condition
  end

  def drink_a_lot(condition)
    if condition['money'] >= 150
      condition['fun'] += 5
      condition['mana'] += 90
      condition['tiredness'] += 80
      condition['hp'] -= 80
      condition['money'] -= 150
    else
      puts("\nС твоими финансами только боярышник глушить.(Нужно не менее 150$)")
    end
    condition
  end

  def sing_in_metro(condition)
    condition['money'] += if condition['mana'].between?(40, 70)
                            60
                          else
                            10
                          end

    condition['fun'] += 1
    condition['mana'] += 10
    condition['tiredness'] += 20
    condition['money'] += 10
    condition
  end

  def go_to_sleep(condition)
    condition['hp'] += 90 if condition['mana'] < 30
    condition['fun'] -= 3 if condition['mana'] > 70
    condition['mana'] -= 50
    condition['tiredness'] -= 70
    condition
  end

  def check_mana(mana)
    mana.between?(0, 100)
  end

  def check_fun(fun)
    fun.between?(-10, 10)
  end

  def check_tire(tiredness)
    tiredness.between?(0, 100)
  end

  def check_money(money)
    money >= 0
  end

  def check_hp(health)
    health.between?(0, 100)
  end
end
