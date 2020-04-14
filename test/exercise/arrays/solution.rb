module Exercise
  module Arrays
    class << self
      def replace(array)
        max_element = array.max
        array.map do |element|
          new_element = element > 0 ? max_element : element
          new_element
        end
      end

      def search(array, query)
        return -1 if array.empty?
        return array[0] == query ? 0 : -1 if array.length == 1

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
    end
  end
end
