require 'sinatra'
require 'yaml'

class ObliqueStrategy
  attr_accessor :text
  
  def initialize
    # Want to throw missing file error back up
    strategies = YAML::load_file('strategies.yml')
    self.text = strategies[rand(strategies.size)]
  end
end

get '/' do
  @strategy = ObliqueStrategy.new
  erb :index
end
