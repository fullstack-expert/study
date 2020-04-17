module Exercise
  module Arrays
    class << self
      def replace(array)
        array.map { |i| i > 0 ? array.max : i }
      end

      def search(_array, _query)
        if _array.length == 0 || _array[0] > _query || _array[_array.length - 1] < _query
          return -1
        else
          first = 0
          last = _array.length - 1
          
          while first <= last
            mid = (first + last) / 2

            if _array[mid] == _query
              return mid
            elsif _array[mid] > _query
              last = mid - 1
            elsif _array[mid] < _query
              first = mid + 1
            else
            end
          end
          return -1
        end
      end
    end
  end
end
