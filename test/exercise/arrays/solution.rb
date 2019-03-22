module Exercise
  module Arrays
    class << self
      def replace(array)
        max_elem_of_array = array.max
        new_array = []

        array.each {|item|
          (item > 0) ? new_array.push(max_elem_of_array) : new_array.push(item)
        }

        return new_array
      end

      def search(array, query)

        low = 0
        high = array.length - 1

        while(low <= high)

          middle = (low+high) / 2
          item = array[middle]

          if(item == query)
            return middle
          elsif(item > query)
            high = middle - 1
          else
            low = middle + 1
          end

        end

        return -1

      end
    end
  end
end
