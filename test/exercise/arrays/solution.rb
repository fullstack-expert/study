module Exercise
  module Arrays
    class << self
      def replace(array)
        max = array.reduce do |acc, n|
          acc > n ? acc : n
        end
        array.map do |el|
          el > 0 ? max : el
        end
      end

      def search(array, query)
        low = 0
        high = array.length - 1

        while low <= high
          mid = (low + high) / 2
          guess = array[mid.to_i]

          return mid if guess == query

          if guess > query
            high = mid - 1
          else
            low = mid +  1
          end
        end
        -1
      end
    end
  end
end
