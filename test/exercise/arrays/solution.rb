module Exercise
  module Arrays
    class << self
      def replace(array)
        max_element = array.max
        array.map { |x| x >= 0 ? max_element : x }
      end

      def search(array, query)
        return -1 if array.empty?
        min_index = 0
        max_index = array.length - 1

        while min_index < max_index
          middle = min_index + (max_index - min_index) / 2
          return middle if array[middle] == query

          max_index = middle if array[middle] > query
          min_index = middle + 1 if array[middle] < query
        end

        array[min_index] == query ? min_index : -1
      end
    end
  end
end
