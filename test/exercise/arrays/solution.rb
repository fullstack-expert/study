module Exercise
  module Arrays
    class << self
      def replace(array)
        i = 1
        max = array[0]
        while i < array.length
          max = array[i] if array[i] > max
          i += 1
        end
        max_arr = max

        j = 0
        while j < array.length
          array[j] = if array[j] > 0
                       max_arr
                     else
                       array[j]
          end
          j += 1
        end
        array
end

      def search(array, num)
        low = 0
        high = array.length - 1
        while low <= high
          mid = (low + high) / 2
          guess = array[mid]
          if guess == num
            mid
          elsif guess > num
            high = mid - 1
          else
            low = mid + 1
          end
        end
        -1
      end
    end
  end
end
