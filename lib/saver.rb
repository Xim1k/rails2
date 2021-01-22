require 'yaml'
require 'pathname'
require_relative '../lib/Valera'

class Saver
  @file_name
  @valera

  def save
    yaml = @valera.condition.to_yaml
    File.open(@file_name, 'w') { |file| file.write(yaml) }
  end

  def saver(valera)
    p('Введите имя пользователя')
    @file_name = "../saves/#{$stdin.gets.strip}.yaml"
    @valera = valera
    save
  end
end

#valera = Valera.new
#valera.condition['hp'] -= 90
#saver = Saver.new.saver(valera)
