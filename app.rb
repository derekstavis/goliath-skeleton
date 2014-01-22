require "rubygems"
require "bundler/setup"
require 'goliath'
require 'fiber'
require 'rack/fiber_pool'
require 'pg'
require 'grape'
require 'yaml'
require 'pry'
require 'em-synchrony/activerecord'

if Goliath.env?(:test)
  require 'factory_girl'
  FactoryGirl.find_definitions
  puts 'Loaded FactoryGirl factories.'
end

Dir["./config/initializers/*.rb"].each { |f| require f }
Dir["./app/models/*.rb"].each { |f| require f }

require './app/api'

class Application < Goliath::API

  def response(env)
    ::API.call(env)
  end

end
