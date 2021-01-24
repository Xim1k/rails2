require 'yaml'

class Valera
  attr_accessor :condition

  def initialize
    file_name = File.expand_path('../config/conf.yaml', __dir__)
    @condition = YAML.safe_load(File.open(file_name))

    return if condition_check(condition)

    abort 'Неправильно оформлен конфигурационный файл!'
  end

  def condition_check(condition)
    unless !condition['money'] || !condition['hp'] || !condition['mana'] || !condition['fun'] || !condition['tiredness']
      return true
    end

    false
  end
end
