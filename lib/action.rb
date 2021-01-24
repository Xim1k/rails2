class Action
  def work(condition)
    system('clear')
    if (condition['mana'] < 50) && (condition['tiredness'] < 10)
      condition['fun'] -= 5
      condition['mana'] -= 30
      condition['money'] += 100
      condition['tiredness'] += 70

      check_valera_stats(condition)
      check_valera_death(condition)
    else
      puts("\nРаботать можно только если алкоголь < 50, усталость < 10")
    end
    condition
  end

  def relax_in_nature(condition)
    system('clear')
    condition['fun'] += 1
    condition['mana'] -= 10
    condition['tiredness'] += 10

    check_valera_stats(condition)
    check_valera_death(condition)

    condition
  end

  def rest(condition)
    system('clear')
    if condition['money'] >= 20
      condition['fun'] -= 1
      condition['mana'] += 30
      condition['tiredness'] += 10
      condition['hp'] -= 5
      condition['money'] -= 20

      check_valera_stats(condition)
      check_valera_death(condition)
    else
      puts("\nИзвини, ты не нашкреб на винишко(Нужно не менее 20$)")
    end
    condition
  end

  def go_to_bar(condition)
    system('clear')
    if condition['money'] >= 100
      condition['fun'] += 1
      condition['mana'] += 60
      condition['tiredness'] += 40
      condition['hp'] -= 10
      condition['money'] -= 100

      check_valera_stats(condition)
      check_valera_death(condition)
    else
      puts("\nВ бар без сотки? Пора на работу!(Нужно не менее 100$)")
    end
    condition
  end

  def drink_a_lot(condition)
    system('clear')
    if condition['money'] >= 150
      condition['fun'] += 5
      condition['mana'] += 90
      condition['tiredness'] += 80
      condition['hp'] -= 80
      condition['money'] -= 150

      check_valera_stats(condition)
      check_valera_death(condition)
    else
      puts("\nС твоими финансами только боярышник глушить.(Нужно не менее 150$)")
    end
    condition
  end

  def sing_in_metro(condition)
    system('clear')
    condition['money'] += if condition['mana'].between?(40, 70)
                            60
                          else
                            10
                          end

    condition['fun'] += 1
    condition['mana'] += 10
    condition['tiredness'] += 20

    check_valera_stats(condition)
    check_valera_death(condition)

    condition
  end

  def go_to_sleep(condition)
    system('clear')
    condition['hp'] += 90 if condition['mana'] < 30
    condition['fun'] -= 3 if condition['mana'] > 70
    condition['mana'] -= 50
    condition['tiredness'] -= 70
    check_valera_stats(condition)
    check_valera_death(condition)
    condition
  end

  def check_valera_stats(condition)
    condition['mana'] = 0 if condition['mana'].negative?
    condition['fun'] = 0 if condition['fun'] > 10
    condition['tiredness'] = 0 if condition['tiredness'].negative?
    condition['hp'] = 100 if condition['hp'] > 100
  end

  def check_valera_death(condition)
    abort 'Алгоколь сыграл соло на сердце. Пожилой умер под забором.' if condition['mana'] > 100
    abort 'Работяга переработал. Валера решил прилечь под прессом.' if condition['tiredness'] > 100
    abort 'Преисполниться не получилось. Валера помер от грусти' if condition['fun'] < -10
    abort 'Дружок-пирожок, че с деньгами? Валеру убили за долги.' unless condition['money'] >= 0
    abort 'Здоровье подкачало. ВДВ умер в постели. Вечная память кролу' if condition['hp'].negative?
  end
end
