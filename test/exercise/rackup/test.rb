require './test/test_helper'
require 'test/unit'
require 'rack/test'
require_relative './inatra'
require_relative './my_app'

class RackTest < Test::Unit::TestCase
  def test_it_says_hello_world
    # omit do
    browser = Rack::Test::Session.new(Rack::MockSession.new(Inatra))
    browser.get '/hello'
    assert browser.last_response.ok?
    assert_equal 'Hello World', browser.last_response.body
    # end
  end

  def wtest_task_created
    browser = Rack::Test::Session.new(Rack::MockSession.new(Inatra))
    browser.post '/tasks'
    assert browser.last_response.created?
    assert_equal 'Task created', browser.last_response.body
  end

  def wtest_task_list
    browser = Rack::Test::Session.new(Rack::MockSession.new(Inatra))
    browser.get '/tasks'
    assert browser.last_response.ok?
    assert_equal 'Task list', browser.last_response.body
  end
end
