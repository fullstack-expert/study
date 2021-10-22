module Exercise
  module Arrays
    class << self
      def replace(array)
        max = array[0]
        array.each { |el| max = el > max ? el : max }
        array.map { |el| el.positive? ? max : el }
      end

      def recursion_search(array, query, left_index, right_index)
        return -1 if right_index < left_index

        middle = (left_index + right_index) / 2

        if array[middle] == query
          middle
        elsif array[middle] < query
          recursion_search(array, query, middle + 1, right_index)
        else
          recursion_search(array, query, left_index, middle - 1)
        end
      end

      def search(_array, _query)
        left_index = 0
        right_index = _array.length - 1
        recursion_search(_array, _query, left_index, right_index)
      end
    end
  end
end
