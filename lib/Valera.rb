require 'yaml'

class Valera
  attr_accessor :stats

  def initialize()
    file_name = File.expand_path("../config/conf.yaml", __dir__)
    @stats = YAML.safe_load(File.open(file_name))

    abort "Неправильно оформлен конфигурационный файл!" if !stats['money'] || !stats['hp'] || !stats['mana'] || !stats['fun'] || !stats['tiredness']
  end
end
