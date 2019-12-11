module Exercise
  module Arrays
    class << self
      def replace(array)
        max_elem = find_max(array)
        array.map { |elem| elem > 0 ? max_elem : elem }
      end

      def find_max(array)
        max = 0
        array.each { |value| max = value if value > max }
        max
      end

      def search(array, query, first = 0, last = array.length - 1) # бинарный поиск в отсортированном массиве
        mid = ((first + last) / 2).floor
        if first <= last
          return mid if array[mid] == query
          if array[mid] > query
            search(array, query, first, mid - 1)
          else
            search(array, query, mid + 1, last)
          end
        else
          -1
        end
      end
    end
  end
end
