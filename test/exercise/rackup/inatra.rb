module Inatra
  class << self
    def routes
    end

    def call(env)
      mapping = {
        'GET' => {
          '/hello' => hello
        },
        'POST' => {
          '/tasks' => tasks
        }
      }

      request_method = env['REQUEST_METHOD']
      path = env['PATH_INFO']
      mapping[request_method][path]
    end

    def hello
      [200, {}, 'Hello World']
    end

    def tasks
      [201, {}, 'Task created']
    end
  end
end
