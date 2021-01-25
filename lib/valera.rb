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

  def self.check_valera_death(condition)
    if condition['mana'] > 100
      p 'Алгоколь сыграл соло на сердце. Пожилой умер под забором.'
      return true
    end
    if condition['tiredness'] > 100
      p 'Работяга переработал. Валера решил прилечь под прессом.'
      return true
    end
    if condition['fun'] < -10
      p 'Преисполниться не получилось. Валера помер от грусти'
      return true
    end
    if condition['hp'].negative?
      p 'Здоровье подкачало. ВДВ умер в постели. Вечная память кролу'
      return true
    end
    false
  end
end
