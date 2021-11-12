module Exercise
  module Arrays
    class << self
      def replace(array)
        max = array[0]
        array.each { |element| max = element if max < element }
        array.map { |element| element.positive? ? max : element }
      end

      def search(array, query)
        start = 0
        endpoint = array.size - 1

        return -1 if array.empty?

        while start <= endpoint
          middle = (start + endpoint) / 2
          return middle if array[middle] == query

          if array[middle] < query
            start = middle + 1
          else
            endpoint = middle - 1
          end
        end
        -1
      end
    end
  end
end
