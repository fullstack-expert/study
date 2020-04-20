module Exercise
  module Arrays
    class << self
      def replace(array)
        max = array.max
        newarr = []

        for item in array do
          if item > 0
            newarr.push(max)
          else
            newarr.push(item)
          end
        end

        return newarr
      end

      def search(_array, _query)
        if _array.length == 0
          return -1
        end

        if _array.length == 1 && _array[0] == _query
          return 0
        end

        if _array.length == 1
          return -1
        end

        arr_start = 0
        arr_end = _array.length

        while arr_start < arr_end do
          arr_middle = arr_start + (arr_end - arr_start) / 2

          if _array[arr_middle] == _query
            return arr_middle
          end

          if _array[arr_middle] > _query 
            arr_end = arr_middle
          else
            arr_start = arr_middle + 1
          end
        end

        return -1
      end
    end
  end
end
