module Exercise
  module Arrays
    class << self
      def replace(array)
        largest = array.inject { |memo, num| memo > num ? memo : num }
        array.map { |el| el.positive? ? largest : el }
      end

      def search(array, query)
        recursive_search = lambda do |sorted_array, key, low, high|
          mid = (low + high) / 2
          guess = sorted_array[mid]
          return - 1 if low > high

          return mid if guess == key

          if guess > key
            recursive_search.call(sorted_array, key, low, mid - 1)
          else
            recursive_search.call(sorted_array, key, mid + 1, high)
          end
        end
        recursive_search.call(array, query, 0, array.length - 1)
      end
    end
  end
end
