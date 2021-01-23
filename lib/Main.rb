require_relative 'Valera'
require_relative 'action'
require_relative 'menu'
require_relative 'saver'
require_relative 'loader'

class Main
  def initialize
    @valera = Valera.new
    @action = Action.new
    @menu = Menu.new
  end

  def start_menu
    loop do
      loop do
        action = gets.chomp.to_i
        puts('Введите значение в диапозоне от 1 до 3') if (action < 1) || (action > 3)

        if action == 1
          start_game
          abort
        end

        if action == 2
          Loader.new.loader(@valera)
          start_game
          abort
        end

        exit 1 if action == 3
      end
    end
  end

  def check_valera
    unless @action.check_mana(@valera.condition['mana'])
      @valera.condition['mana'] = 0 if @valera.condition['mana'].negative?
      abort 'Алгоколь сыграл соло на сердце. Пожилой умер под забором.' if @valera.condition['mana'].positive?
    end

    unless @action.check_fun(@valera.condition['fun'])
      @valera.condition['fun'] = 10 if @valera.condition['fun'] > 10
      abort 'Преисполниться не получилось. Валера помер от грусти' if @valera.condition['mana'] < -10
    end

    unless @action.check_tire(@valera.condition['tiredness'])
      @valera.condition['tiredness'] = 0 if @valera.condition['tiredness'].negative?
      abort 'Работяга переработал. Валера решил прилечь под прессом.' if @valera.condition['tiredness'] > 100
    end

    abort 'Дружок-пирожок, че с деньгами? Валеру убили за долги.' unless @action.check_money(@valera.condition['money'])

    unless @action.check_hp(@valera.condition['hp'])
      @valera.condition['hp'] = 100 if @valera.condition['hp'] > 100
      abort 'Здоровье подкачало. ВДВ умер в постели. Вечная память кролу' if @valera.condition['hp'].negative?
    end
  end

  def start_game
    loop do
      loop do
        action = gets.chomp.to_i
        puts('Введите значение в диапозоне от 1 до 9') if (action < 1) || (action > 9)

        @valera.condition = @action.work(@valera.condition) if action == 1

        @valera.condition = @action.relax_in_nature(@valera.condition) if action == 2

        @valera.condition = @action.rest(@valera.condition) if action == 3

        @valera.condition = @action.go_to_bar(@valera.condition) if action == 4

        @valera.condition = @action.drink_a_lot(@valera.condition) if action == 5

        @valera.condition = @action.sing_in_metro(@valera.condition) if action == 6

        @valera.condition = @action.go_to_sleep(@valera.condition) if action == 7

        if action == 8
          Saver.new.saver(@valera)
          puts('Игра сохранена')

          return
        end

        return if action == 9

        check_valera
      end
    end
  end
end

main = Main.new
main.start_menu
