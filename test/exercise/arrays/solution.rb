module Exercise
  module Arrays
    class << self
      def replace(array)
        max = array.max
        array.map { |x| x.positive? ? max : x }
      end

      def search(array, query, left = 0, right = array.size - 1)
        if right >= left
          mid = left + (right - left) / 2
          return mid if array[mid] == query

          if array[mid] > query
            return search(array, query, left, mid - 1)
          end
          return search(array, query, mid + 1, right)
        end
        -1
      end
    end
  end
end
