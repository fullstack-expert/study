module Exercise
  module Arrays
    class << self
      
      def replace(array)
        max = array.reduce() { |max, el| max < el ? el : max }
        array.map { |i| i > 0 ? max : i }
      end

      def search(_array, _query)
      
        firstIndex = 0
        lastIndex = _array.length - 1
        mid = (firstIndex + lastIndex) / 2

        while firstIndex <= lastIndex
          if _array[mid] == _query
            return  mid
          elsif _array[mid] < _query
            firstIndex = mid + 1
            mid = (firstIndex + lastIndex) / 2
          elsif _array[mid] > _query
            lastIndex = mid - 1
            mid = (firstIndex + lastIndex) / 2 
          end
        end
        
        return -1 

      end
    end
  end
end
