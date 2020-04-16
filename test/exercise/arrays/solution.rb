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

        if array.length == 1
          return array[0] == query ? 0 : -1
        end

        middle = array.length / 2
        start_index = 0
        end_index = array.length - 1
        while start_index <= end_index
          middle = (start_index + end_index) / 2

          if array[middle] < query
            start_index = middle + 1
          elsif array[middle] > query
            end_index = middle - 1
          else
            return middle
          end
        end
        -1
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
