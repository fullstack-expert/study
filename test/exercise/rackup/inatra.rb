module Inatra
  @@handlers = {}

  class << self
    def routes(&block)
      instance_eval(&block)
    end

    def call(env)
      handle_request(env['REQUEST_METHOD'], env['PATH_INFO'])
    end

    private

    def get(path, &block)
      @@handlers['get'] ||= {}
      @@handlers['get'][path] = -> { block.call }
    end

    def handle_request(method, path)
      handler = @@handlers.dig(method.downcase, path)
      handler.call if handler
    end
  end
end
