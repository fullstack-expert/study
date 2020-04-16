module Exercise
  module Arrays
    class << self
      def replace(array)

        max_arr = array.max
        i = 0
        while i < array.length do
          if array[i] > 0
            array[i] = max_arr
          end
          i += 1
        end
        return array  
      end

      def search(_array, _query)
        left = 0
        right = _array.length - 1 
        while right >= left
          middle = (left + right) / 2
          if _array[middle] == _query
            return middle
          elsif _array[middle] < _query
            left = middle + 1
          else 
            right = middle - 1
          end
        end
        return -1
      end
    end
  end
end
