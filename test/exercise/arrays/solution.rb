module Exercise
  module Arrays
    class << self
      def replace(array)
        max = array.max
        for i in 0..array.length - 1
          array[i] = max if array[i] > 0
        end
        array
      end

      def search(array, query)
        bin_search array, query, 0, array.length - 1
      end

      def bin_search(array, query, left, right)
        return -1 unless left <= right
        i = (left + right) / 2
        if array[i] == query
          i
        elsif array[i] < query
          bin_search array, query, i + 1, right
        elsif array[i] > query
          bin_search array, query, left, i - 1
        end
      end
    end
  end
end
