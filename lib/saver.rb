require 'yaml'
require 'pathname'
require_relative '../lib/Valera'

class Saver
  def save
    yaml = @valera.condition.to_yaml
    File.open(@file_name, 'w') { |file| file.write(yaml) }
  end

  def saver(valera)
    puts('Введите имя пользователя')
    @file_name = File.expand_path("../saves/#{$stdin.gets.strip}.yaml", __dir__)
    @valera = valera
    save
  end
end
