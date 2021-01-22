require 'yaml'
require 'pathname'
require_relative '../lib/Valera'

class Saver
  def initialize(file_name, valera)
    @file_name = File.expand_path("../saves/#{file_name}.yaml", __dir__)
    @valera = valera
  end

  def save
    yaml = @valera.condition.to_yaml
    File.open(@file_name, 'w') { |file| file.write(yaml) }
  end
end

# valera = Valera.new
# valera.condition['hp'] -= 90
# saver = Saver.new('testsave',valera).save
