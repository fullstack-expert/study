module Exercise
  module Arrays
    class << self
      def replace(array)
        def find_max(_arr)
          max = _arr[0]

        _arr.each do |i|
          max = max < i ? i : max
        end

        max
        end
        max_elemen = find_max(array)
        array.map { |elem| elem > 0 ? array.max : elem }
      end
      def search(_array, _query)
        low = 0
        high = _array.size - 1

        while low <= high
          mid = (low + high) / 2
          guess = _array[mid]
          return mid if guess == _query

          if guess > _query
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
