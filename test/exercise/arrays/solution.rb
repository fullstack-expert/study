module Exercise
  module Arrays
    class << self
      
      def replace(array)
        array.index(array.first).upto(array.rindex(array.last)) do |i|
          if array[i] >= 0
            array[i] = array.max
          end
        end
      end

      def search(array, e)
        mid = array.size / 2
        low = 0
        high = array.size - 1
        while array[mid] != e and low < high do
          if e > array[mid]
            low = mid + 1
          else
            high = mid - 1
          end
          mid = (low + high) / 2
        end
        if e != array[mid]
          return -1
        else
          return mid
        end
      end

    end
  end
end
