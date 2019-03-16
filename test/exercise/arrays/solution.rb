module Exercise
  module Arrays
    class << self
      def replace(array)
        max_item = array.max
        array.map { |item| item.positive? ? max_item : item }
      end

      def search(array, query)
        left = 0
        right = array.length - 1

        while left <= right
          mid = (left + right) / 2
          guess = array[mid]

          return mid if guess == query

          if guess < query
            left = mid + 1
          else
            right = mid - 1
          end
        end

        -1
      end
    end
  end
end
