module Exercise
  module Arrays
    class << self
      def replace(array)
        max_of_array = get_max_of_arr(array)
        get_new_array(array, max_of_array)
      end

      def search(array, query)
        low = 0
        high = array.length - 1
        get_index(array, query, low, high)
      end

      private

      def get_max_of_arr(array)
        max = 0
        array.each do |item|
          max = item if item > max
        end
        max
      end

      def get_new_array(array, max)
        result = []
        array.each do |item|
          item > 0 ? result.push(max) : result.push(item)
        end
        result
      end

      def get_index(array, query, low, high)
        while low <= high
          middle = (low + high) / 2
          item = array[middle]
          return middle if item == query
          item > query ? high = middle - 1 : low = middle + 1
        end
        -1
      end
    end
  end
end
