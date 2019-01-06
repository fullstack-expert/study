module Inatra
  class << self
    def routes(&block)
      @routes ||= {}
      instance_eval(&block)
    end

    def call(env)
      req_method = env['REQUEST_METHOD'].downcase.to_sym
      return [404, {}, ['Not found']] if @routes[req_method][env['PATH_INFO']].nil?
      @routes[req_method][env['PATH_INFO']].call
    end

    def get(path, &block)
      @routes[:get] ||= {}
      @routes[:get][path] = block
    end

    def post(path, &block)
      @routes[:post] ||= {}
      @routes[:post][path] = block
    end
  end
end
