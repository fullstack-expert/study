module Exercise
  module Arrays
    class << self
      def max(array)
        max = array[0]
        for element in array
          max = element if element > max
        end

        max
      end

      def replace(array)
        res = []
        max = self.max(array)
        for element in array
          element = max if element > 0
          res << element
        end

        res
      end

      def search(_array, _query)
        first = 0
        last = _array.length - 1

        while first <= last
          index = (first + last) / 2

          if _array[index] == _query
            return index
          elsif _array[index] > _query
            last = index - 1
          elsif _array[index] < _query
            first = index + 1
          end
        end

        return -1
      end
    end
  end
end
