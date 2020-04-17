module Exercise
  module Arrays
    class << self
      def replace(array)
        biggest_element = max_element(array)
        array.map do |element|
          element > 0 ? biggest_element : element
        end
      end

      def search(array, query)
        return -1 if array.empty?

        binary_search(array, query, 0, array.length - 1)
      end

      def binary_search(array, query, start_index, end_index)
        if start_index == end_index
          return start_index if array[start_index] == query
          return -1
        end

        middle = (start_index + end_index) / 2
        return middle if array[middle] == query

        return binary_search(array, query, middle + 1, end_index) if array[middle] < query

        binary_search(array, query, start_index, middle - 1)
      end

      def max_element(array)
        max = array.first

        i = 1
        while i < array.size
          max = array[i] if max < array[i]
          i += 1
        end

        max
      end
    end
  end
end
