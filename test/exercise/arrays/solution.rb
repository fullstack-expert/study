module Exercise
  module Arrays
    class << self
      def replace(array)
        max = array.max
        array.map { |i| i < max && i >= 0 ? max : i  }
      end

      def search(_array, _query)
        startIndex = 0
        lastIndex = _array.length - 1

        while true do
          leftLastIndex = lastIndex / 2
          rightLastIndex = lastIndex

          if _query == _array[leftLastIndex]
            return leftLastIndex
          elsif _query == _array[rightLastIndex]
            return rightLastIndex
          elsif rightLastIndex - leftLastIndex < 1
            return -1
          elsif _query > _array[leftLastIndex]
            startIndex = leftLastIndex + 1
            lastIndex -= 1
          elsif _query < _array[leftLastIndex]
            lastIndex = leftLastIndex - 1
          end
        end
      end
    end
  end
end
