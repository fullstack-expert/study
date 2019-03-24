module Exercise
  module Arrays
    class << self
      def replace(array)
        max_item = max_element(array)
        array.map { |item| item.positive? ? max_item : item }
      end

      def max_element(array)
        max = array[0]

        array.each do |i|
          max = max < i ? i : max
        end

        max
      end

      def search(array, query, initial_array = [])
        initial_array = initial_array.empty? ? array : initial_array

        left = 0
        right = array.length - 1

        mid = (left + right) / 2
        guess = array[mid]

        return initial_array.index(guess) if guess == query
        return -1 if left >= right

        if guess < query
          left = mid + 1
        else
          right = mid - 1
        end

        search(array[left..right], query, initial_array)
      end
    end
  end
end
