require 'yaml'
require 'pathname'
require_relative '../lib/Valera'

class Loader
  def initialize(file_name)
    @file_name = File.expand_path("../saves/#{file_name}.yaml", __dir__)
  end

  def load(valera)
    valera.condition = YAML.safe_load(File.open(@file_name))
  end

  def exist
    Pathname.new(@file_name).exist?
  end

  #def load(file_name)
  #  @file_name = File.expand_path("../saves/#{file_name}.yaml", __dir__)
  #  data = YAML.safe_load(File.open(@file_name))
  #  data
  #end
end

#valera = Valera.new
#p valera.condition
#loader = Loader.new('testsave').load(valera)
#p valera.condition
