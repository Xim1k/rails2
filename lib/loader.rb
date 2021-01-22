require 'yaml'
require 'pathname'
require_relative '../lib/Valera'

class Loader
  @file_name

  def load(valera)
    valera.condition = YAML.safe_load(File.open(@file_name))
  end

  def exist
    Pathname.new(@file_name).exist?
  end

  def loader(valera)
    loop do
      p('Введите имя пользователя')
      @file_name = "../saves/#{$stdin.gets.strip}.yaml"
      break if exist

      puts('Такого пользователя не существует')
    end
    @file_name = File.expand_path("../saves/#{@file_name}", __dir__)
    load(valera)
  end
end

#valera = Valera.new
#p valera.condition
#loader = Loader.new.loader(valera)
#p valera.condition
# p valera.condition
