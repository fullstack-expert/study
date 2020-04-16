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
      mapping = {
        'GET' => {
          '/hello' => ->() { hello }
        },
        'POST' => {
          '/tasks' => ->() { tasks }
        }
      }
    end

    def call(env)
      request_method = env['REQUEST_METHOD']
      path = env['PATH_INFO']
      routes[request_method][path].call
    end

    def hello
      [200, {}, 'Hello World']
    end

    def tasks
      [201, {}, 'Task created']
    end
  end
end
