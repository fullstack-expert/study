module Inatra
  class << self
    def routes
    end

    def call(_env)
      headers = {}

      [200, headers, 'Hello World']
    end
  end
end
