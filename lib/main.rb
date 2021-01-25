require_relative 'valera'
require_relative 'action'
require_relative 'menu'
require_relative 'saver'
require_relative 'loader'

class Main
  attr_accessor :current_action

  def initialize
    @valera = Valera.new
    @action = Action.new
    @menu = Menu.new
  end

  def start_menu
    loop do
      loop do
        @menu.print_main_menu
        action = gets.chomp.to_i

        start_game if action == 1

        if action == 2
          Loader.new.loader(@valera)
          start_game
        end

        exit 1 if action == 3

        puts('Введите значение в диапозоне от 1 до 3') unless action.between?(1, 3)
      end
    end
  end

  def start_game
    loop do
      loop do
        new_game
        print_info
        @current_action = gets.chomp.to_i

        return if @current_action == 9

        puts('Введите значение в диапозоне от 1 до 9') if @current_action < 1 && @current_action > 9

        if @current_action == 8
          Saver.new.saver(@valera)
          puts('Игра сохранена')

          return
        end

        case @current_action
        when 1..7
          menu_action_first
          menu_action_second
        end
      end
    end
  end

  def menu_action_first
    case @current_action
    when 1
      @valera.condition = @action.work(@valera.condition)
    when 2
      @valera.condition = @action.relax_in_nature(@valera.condition)
    when 3
      @valera.condition = @action.rest(@valera.condition)
    when 4
      @valera.condition = @action.go_to_bar(@valera.condition)
    end
  end

  def menu_action_second
    case @current_action
    when 5
      @valera.condition = @action.drink_a_lot(@valera.condition)
    when 6
      @valera.condition = @action.sing_in_metro(@valera.condition)
    when 7
      @valera.condition = @action.go_to_sleep(@valera.condition)
    end
  end

  def print_info
    @menu.print_condition(@valera)
    @menu.print_reference
    @menu.print_actions_menu
  end

  def new_game
    return unless @valera.condition['dead']

    initialize
    start_menu
  end
end

main = Main.new
main.start_menu
