module Exercise
  module Arrays
    class << self
      def replace(array)
        largest = array.inject do |memo, num|
          memo > num ? memo : num
        end

        array.map { |el| el.positive? ? largest : el }
      end

      def search(array, query)
        low = 0
        high = array.length - 1
        while low <= high
          mid = (low + high)
          guess = array[mid]
          if guess == query
            return mid
          elsif guess > query
            high = mid - 1
          else
            low = mid + 1
          end
        end
        -1
      end
    end
  end
end
