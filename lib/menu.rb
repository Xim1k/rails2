require_relative 'Valera'
require_relative 'action'

class Menu
  def print_main_menu
    puts('1.Новая игра')
    puts('2.Загрузить игру')
    puts('3.Выход')
  end

  def print_actions_menu
    puts('1.Пойти на работу')
    puts('2.Отдыхать на природе')
    puts('3.Смотреть сериал под бокальчик вина')
    puts('4.Пропустить стаканчик в баре')
    puts('5.Напиться с друзьями')
    puts('6.Петь в метро')
    puts('7.Спать')
    puts('8.Сохранить')
    puts('9.Выход')
  end

  def print_condition(valera)
    puts('Показатели Валеры:')
    puts("Здоровье: #{valera.condition['hp']}")
    puts("Алкоголь: #{valera.condition['mana']}")
    puts("Веселье: #{valera.condition['fun']}")
    puts("Усталость: #{valera.condition['tiredness']}")
    puts("Деньги: #{valera.condition['money']}")
  end
end
# a = Menu.new
# valera = Valera.new
# a.print_condition(valera)
# a.print_main_menu
# a.print_actions_menu
