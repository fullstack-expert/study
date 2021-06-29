module Exercise
  module Arrays
    class << self
      def max(array)
        max = array[0]
        for element in array
          max = element if element > max
        end

        max
      end

      def replace(array)
        res = []
        max = self.max(array)
        for element in array
          element = max if element.positive?
          res << element
        end

        res
      end

      def search(array, query)
        first = 0
        last = array.length - 1

        while first <= last
          index = (first + last) / 2

          return index if array[index] == query

          if array[index] > query
            last = index - 1
          elsif array[index] < query
            first = index + 1
          end
        end

        -1
      end
    end
  end
end
