module Inatra
  class << self
    @@routes = []
    def routes
      yield
    end

    def get(path, &block)
      @@routes << { path: path, block: block }
    end

    def call(env)
      path = env['PATH_INFO']
      @@routes.each { |route| return route[:block].call if path == route[:path] }
    end
  end
  module Delegator
    def self.delegate
      define_method('get') do |path, &block|
        return Inatra.get(path, &block)
      end
    end
    delegate
  end
end

extend Inatra::Delegator
