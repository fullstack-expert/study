module Exercise
  module Arrays
    class << self
      def replace(array)
        max = array.reduce { |acc, element| acc > element ? acc : element }
        array.map { |element| element.positive? ? max : element }
      end

      def binary_search(array, target, min_index, max_index)
        mid_index = (max_index + min_index) / 2
        return -1 if array.empty? || (target > array[max_index]) || (target < array[min_index])

        return mid_index if target == array[mid_index]

        if target > array[mid_index]
          binary_search(array, target, mid_index + 1, max_index)
        elsif target < array[mid_index]
          binary_search(array, target, min_index, mid_index - 1)
        end
      end

      def search(array, query)
        min_index = 0
        max_index = array.length - 1
        binary_search(array, query, min_index, max_index)
      end
    end
  end
end
