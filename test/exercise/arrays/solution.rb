module Exercise
  module Arrays
    class << self
      def replace(array)
        max = array[0]
        array.each { |element| max = element if max < element }
        array.map { |element| element.positive? ? max : element }
      end

      def search(array, query, first = 0, last = nil)
        last ||= array.size - 1
        middle = (first + last) / 2

        return -1 if first > last

        return middle if array[middle] == query

        if array[middle] < query
          first = middle + 1
        else
          last = middle - 1
        end
        search(array, query, first, last)
      end
    end
  end
end
