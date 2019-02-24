module Exercise
  module Arrays
    class << self
      def replace(array)
        max = 0
        array.each { |num| max = num if num > max }
        array.map { |num| num > 0 ? max : num }
      end

      def search(array, query)
        left = 0
        right = array.size - 1
        while left <= right
          middle = (left + right) / 2
          if array[middle] < query
            left = middle + 1
          elsif array[middle] > query
            right = middle - 1
          else
            return middle
          end
        end
        -1
      end
    end
  end
end
