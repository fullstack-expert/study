module Exercise
  module Arrays
    class << self
      def replace(array)
        max_elem = array.max
        array.map { |elem| elem > 0 ? max_elem : elem }
      end

      def search(array, query) # бинарный поиск в отсортированном массиве
        return -1 if array.empty?
        return array[0] == query ? 0 : -1 if array.length == 1

        first = 0
        last = array.length - 1

        while first <= last
          mid = ((first + last) / 2).floor
          return mid if array[mid] == query
          if array[mid] > query
            last = mid - 1
          else
            first = mid + 1
          end
        end
        -1
      end
    end
  end
end
