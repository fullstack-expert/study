module Exercise
  module Arrays
    class << self
      def replace(array)
        max = array.max
        array.map { |e| e > 0 ? max : e }
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
