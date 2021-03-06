require 'yaml'
require 'pathname'
require_relative '../lib/valera'

class Loader
  def load(valera)
    valera.condition = YAML.safe_load(File.open(@file_name))
  end

  def exist
    Pathname.new(@file_name).exist?
  end

  def loader(valera)
    loop do
      puts('Введите название сохранения')
      @file_name = File.expand_path("../saves/#{$stdin.gets.strip}.yaml", __dir__)
      break if exist

      puts('Такого сохранения не существует')
    end

    load(valera)
  end
end
