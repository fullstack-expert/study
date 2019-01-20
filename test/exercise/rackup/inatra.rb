module Inatra
  class << self
    def method_missing(method_name, *args, &block)
      path = args.first.to_s
      method = method_name.upcase.to_s
      @routes[path] ||= {}
      @routes[path][method] = block
    end

    def routes(&block)
      @routes ||= {}
      instance_eval(&block)
    end

    def call(env)
      path = env['PATH_INFO']
      method = env['REQUEST_METHOD'].upcase.to_s
      @routes[path][method].call(env)
    end
  end
end
