module Exercise
  module Arrays
    class << self
      def replace(array)
        max = array.max
        result = array.map { |item|
          item > 0 ? max : item
        }
        return result
      end

      def search(_array, _query)
        0
      end
    end
  end
end
