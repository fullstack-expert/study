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
  end
end
