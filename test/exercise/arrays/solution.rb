module Exercise
  module Arrays
    class << self
      def replace(array)
        array.map do |y|
          if y > 0
             array.max
          else
             y
          end
        end
      end

      def search(_array, _query)
        min = 0
        max = _array.length - 1
        while min <= max
            mid = (min + max)/2
            x = _array[mid]
            if x == _query
                return mid                
            elsif _query < x
                max = mid - 1 
            else 
                min = mid + 1
            end
        end
        return - 1
      end
    end
  end
end