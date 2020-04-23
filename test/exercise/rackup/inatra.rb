module Inatra
  @@routes = {}

  class << self
    def routes(&block)
      instance_eval(&block)
    end

    def call(env)
      path = env['PATH_INFO']
      method = env['REQUEST_METHOD']

      send method.downcase, path
    end

    def method_missing(m, arg, &block)
      if block_given?
        new_attrs = @@routes[m] ? { arg => -> { block.call }, **@@routes[m] } : { arg => -> { block.call } }
        @@routes[m] = new_attrs
      else
        @@routes[m][arg].call
      end
    end
  end
end
