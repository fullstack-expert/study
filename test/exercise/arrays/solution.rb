module Exercise
  module Arrays
    class << self
      def replace(array)
        array.map do |el|
          el.positive? ? array.max : el
        end
      end

      def search(array, query)
        result = array.index query
        result.nil? ? -1 : result
      end
    end
  end
end
