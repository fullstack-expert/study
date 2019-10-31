module Exercise
  module Arrays
    class << self
      def replace(array)
        array.map { |a| a > 0 ? array.max : a }
      end

      def search(_array, _query)
        low = 0
        high = _array.length - 1

        while low <= high
          mid = (low + high) / 2
          guess = _array[mid]
          if guess == _query
            return mid
          end
          if guess > _query
            high = mid - 1
          else
            low = mid + 1
          end
        end
        return -1
      end
    end
  end
end
