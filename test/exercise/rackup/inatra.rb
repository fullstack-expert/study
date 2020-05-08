module Inatra
  class << self
    def routes(&block)
      @handlers = {}
      instance_eval(&block)
    end

    def method_missing(verb_name, path, &block)
      verb = verb_name.to_s
      @handlers[verb] = {}
      @handlers[verb][path] = block
    end

    def call(env)
      verb = env['REQUEST_METHOD'].to_s.downcase
      path = env['PATH_INFO']
      @handlers[verb][path].call
    end
  end
end
