require 'yaml'

class Action

  def work(condition)
    if (condition['mana'] < 50) && (condition['tiredness'] < 10)
      condition['fun'] -= 5
      condition['mana'] -= 30
      condition['money'] += 100
      condition['tiredness'] += 70
    end
    condition
  end

  def relax_in_nature(condition)
    condition['fun'] += 1
    condition['mana'] -= 10
    condition['tiredness'] += 10
    condition
  end

  def rest(condition)
    if condition['money'] >= 20
      condition['fun'] -= 1
      condition['mana'] += 30
      condition['tiredness'] += 10
      condition['hp'] -= 5
      condition['money'] -= 20
    end
    condition
  end

  def go_to_bar(condition)
    if condition['money'] >= 100
      condition['fun'] += 1
      condition['mana'] += 60
      condition['tiredness'] += 40
      condition['hp'] -= 10
      condition['money'] -= 100
    end
    condition
  end

  def drink_a_lot(condition)
    if condition['money'] >= 150
      condition['fun'] += 5
      condition['mana'] += 90
      condition['tiredness'] += 80
      condition['hp'] -= 80
      condition['money'] -= 150
    end
    condition
  end

  def sing_in_metro(condition)
    condition['money'] += 50 if (condition['mana'] > 40) && (condition['mana'] < 70)
    condition['fun'] += 1
    condition['mana'] += 10
    condition['tiredness'] += 20
    condition['money'] += 10
    condition
  end

  def go_to_sleep(condition)
    condition['hp'] += 90 if condition['mana'] < 30
    condition['fun'] -= 3 if condition['mana'] > 70
    condition['mana'] -= 50
    condition['tiredness'] -= 70
    condition
  end
end


=begin class Valera
  attr_accessor :stats

  def initialize()
    file_name = File.expand_path("conf.yaml", __dir__)
    @stats = YAML.safe_load(File.open(file_name))
  end
end

valera = Valera.new
action = Action.new
p valera.stats['hp']
action.rest(valera.stats)
p valera.stats['hp']
=end
