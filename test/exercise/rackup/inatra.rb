module Inatra
  @routes = {}

  class << self
    def routes(&block)
      instance_eval(&block)
    end

    def method_missing(verb_name, *path, &block)
      if path.length == 1
        @routes[verb_name.to_s.upcase] ||= {}
        @routes[verb_name.to_s.upcase][path[0]] = block
      else
        super
      end
    end

    def respond_to_missing?(verb_name, *_path)
      @routes.include?(verb_name.to_s.upcase)
    end

    def call(env)
      request_method = env['REQUEST_METHOD']
      path = env['PATH_INFO']
      func = @routes[request_method][path]
      func ? func.call : [404, {}, ['Not Found']]
    end
  end
end