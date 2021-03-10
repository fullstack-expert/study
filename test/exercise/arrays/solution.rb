module Exercise
  module Arrays
    class << self
      def replace(array)
        max = array.max
        array.map { |v| v.positive? ? max : v }
      end

      def search(array, query)
        left = 0
        right = array.length - 1
        while left <= right
          middle = ((left + right) / 2).floor

          return middle if array[middle] == query

          if array[middle] < query
            left = middle + 1
          else
            right = middle - 1
          end
        end

        -1
      end
    end
  end
end
