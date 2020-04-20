module Exercise
  module Arrays
    class << self
      def replace(array)
        max_el = array.max
        i = 0
        while i < array.length do
          if array[i] > 0
            array[i] = max_el
          end
          i += 1
        end
        return array
      end

      def search(_array, _query)
        mid = _array.length / 2
        low = 0
        high = _array.length - 1

        while (_array[mid] != _query && low <= high) do 
          if _query > _array[mid] 
            low = mid + 1
          else
            high = mid - 1
          end
          mid = (low + high) / 2
        end
        if low > high 
          return -1
        else
          return mid
        end
      end
    end
  end
end
