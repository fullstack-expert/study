module Exercise
  module Arrays
    class << self
      def replace(array)
        arr = []
        for el in array
          arr << 100 if el >= 0
          arr << el if el.negative?
        end
        arr
      end

      def search(array, query)
        return -1 unless array.include? query

        left = -1
        right = array.length
        while left < right - 1
          middle = (left + right) / 2
          if array[middle] < query
            left = middle
          else
            right = middle
          end
        end
        right
      end
    end
  end
end
