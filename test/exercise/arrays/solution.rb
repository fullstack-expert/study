module Exercise
  module Arrays
    class << self
      def replace(array)
        max = array.max
        array.map { |number| number.positive? ? max : number }
      end

      def bin_search(arr, low, high, query)
        return -1 if low > high

        mid = (low + high) / 2

        if query == arr[mid]
          mid
        elsif query < arr[mid]
          bin_search(arr, low, mid - 1, query)
        else
          bin_search(arr, mid + 1, high, query)
        end
      end

      def search(array, query)
        return -1 if !array || !query
        return -1 if array.empty?

        low = array.index(array[0])
        high = array.index(array.max)
        bin_search(array, low, high, query)
      end
    end
  end
end
