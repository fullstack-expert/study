module Exercise
  module Arrays
    class << self
      def replace(array)
        max = array.max
          array.each_with_index do |val, i|
          array[i] = max if val.positive?
          end
        end
      def search(_array, _query)
        max = _array.length - 1
        min = 0
        while min <= max
          mid = (min + max) / 2
          if _array[mid] == _query
            return mid
          elsif _array[mid] > _query
            max = mid - 1
          else
            min = mid + 1
          end
        end
        return -1
      end
    end
  end
end  
