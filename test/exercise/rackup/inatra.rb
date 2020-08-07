module Inatra
  class << self
    WHITELIST_REQUEST_METHODS = %i[get post put patch delete].freeze

    def routes(&block)
      module_eval(&block)
    end

    def call(env)
      request_method = env['REQUEST_METHOD'].downcase.to_sym
      request_path = env['PATH_INFO']

      @routes[request_method].key?(request_path) ? @routes[request_method][request_path] : [404, {}, ['Not Found']]
    end

    def method_missing(request_method, path)
      if WHITELIST_REQUEST_METHODS.include?(request_method)
        @routes ||= {}
        @routes[request_method] ||= {}
        @routes[request_method][path] = yield
      else
        super
      end
    end

    def respond_to_missing?(request_method)
      WHITELIST_REQUEST_METHODS.include?(request_method)
    end
  end
end
