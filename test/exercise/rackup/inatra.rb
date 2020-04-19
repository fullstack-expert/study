module Inatra
  class << self
    def routes
    end

    def call(env)
      path = env['PATH_INFO']
      method = env['REQUEST_METHOD']
      instance_eval "#{method.downcase}#{path.split('/').join('_')}"
    end

    def get_hello
      [200, {}, 'Hello World']
    end

    def post_tasks
      [201, {}, 'Task created']
    end

    def get_tasks
      [200, {}, 'Task list']
    end
  end
end
