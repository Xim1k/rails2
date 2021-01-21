require_relative 'Valera'

class Main
  def initialize
    @valera = Valera.new
  end

  def start
    loop do
        loop do
          action = gets.chomp.to_i
          return unless (action < 1) || (action > 10)

          puts('Введите значение в диапозоне от 1 до 10')
        end

        if @valera == false
            abort 'Валера умер под забором!'
        end
    end
  end
end

main = Main.new
main.start
