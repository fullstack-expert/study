module Exercise
  module Arrays
    class << self
      def replace(array)
        max = array.max
        return array.map { |value| value.positive ? max : value }
      end

      def search(array, query)
        left = 0
        right = array.size - 1
        
        while left <= right
          middle = (left + right) / 2
          if array[middle] < query
            left = middle + 1
          elsif array[middle] > query
            right = middle - 1
          elsif array[middle] == query
            return middle
          end
        end
        
        return -1
      end
    end
  end
end
