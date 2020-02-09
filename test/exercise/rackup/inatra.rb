module Inatra
  class << self
    def routes(&block)
      @routes = {}
      class_eval(&block)
    end

    def get(path, &block)
      @routes[path] = block.() if block
    end

    def call(env)
      @routes[Rack::Request.new(env).path_info]
    end
  end
end
