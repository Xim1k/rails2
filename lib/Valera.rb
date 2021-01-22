require 'yaml'

class Valera
  attr_accessor :condition

  def initialize()
    file_name = File.expand_path("../config/conf.yaml", __dir__)
    @condition = YAML.safe_load(File.open(file_name))

    abort "Неправильно оформлен конфигурационный файл!" if !condition['money'] || !condition['hp'] || !condition['mana'] || !condition['fun'] || !condition['tiredness']
  end
end
