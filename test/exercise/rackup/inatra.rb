module Inatra
  class << self
    def routes
      {
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
      # routes[request_method][path].call
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
    end
  end
end
