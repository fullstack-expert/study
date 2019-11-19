require 'rubygems'
require 'factory_girl'
require 'bundler/setup'
require 'pry'

require 'coveralls'
require 'minitest/autorun'

Coveralls.wear!
FactoryGirl.reload

class Minitest::Test
  include FactoryGirl::Syntax::Methods
end
