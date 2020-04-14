module Inatra
  class << self
    def routes
    end

    def call(env)
      path = env['PATH_INFO']
      instance_eval path.slice(1, path.length)
    end

    def hello
      [200, {}, 'Hello World']
    end

    def tasks
      [201, {}, 'Task created']
    end

    def method_missing(m, *args, &block)
      p "Delegating #{m}"
      # object.send(m, *args, &block)
    def call(_env)
      headers = {}

      [200, headers, 'Hello World']
    end
  end
end
