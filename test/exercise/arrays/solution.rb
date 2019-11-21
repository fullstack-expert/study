module Exercise
  module Arrays
    class << self
      def replace(array)
        index_arr = 0
        max_value = array[index_arr]
        a = array.length - 1
        while index_arr < a
          max_value = array[index_arr + 1] if array[index_arr] < array[index_arr + 1] && array[index_arr + 1] > max_value
          index_arr += 1
        end
        index_arr = 0
        while index_arr < array.length
          array[index_arr] = max_value if (array[index_arr]).positive?
          index_arr += 1
        end
        array
      end

      def search(array, query)
        first_index = 0
        last_index = array.length - 1
        while first_index <= last_index
          middle_index = (first_index + last_index) / 2
          return middle_index if array[middle_index] == query

          first_index = middle_index + 1 if array[middle_index] < query
          last_index = middle_index - 1 if array[middle_index] > query
        end
        -1
      end
    end
  end
end
