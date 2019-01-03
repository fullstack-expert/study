module Exercise
  module Arrays
    class << self
      def replace(array)
        max = array.max
        array.map { |i| i < max && i >= 0 ? max : i }
      end

      def search(array, query)
        first_index = 0
        last_index = array.length - 1

        loop do
          left_last_index = last_index / 2
          right_last_index = last_index

          return left_last_index if query == array[left_last_index]
          return right_last_index if query == array[right_last_index]
          return -1 if stay_max_two_items(right_last_index, left_last_index)

          if query > array[left_last_index]
            first_index = left_last_index + 1
            last_index -= 1
          elsif query < array[left_last_index]
            last_index = left_last_index - 1
          end
        end
      end

      def stay_max_two_items(n1, n2)
        (n1 - n2).abs < 2
      end
    end
  end
end
