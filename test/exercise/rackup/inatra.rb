require 'byebug'

module Inatra
  class << self
    def routes(&block)
      instance_eval &block
    end

    def call(env)
      handle_request(env['REQUEST_METHOD'], env['PATH_INFO'])
    end

    private

    def method_missing(name, path, &block)
      define_method "#{name}_#{path}" do
        instance_eval &block
      end
    end

    def handle_request(method, path)
      send("#{method}_#{path}")
    end
  end
end
