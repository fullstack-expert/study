module Exercise
  module Arrays
    class << self
      def replace(array)
        max_number = get_max_number(array)
        array.map { |num| num.positive? ? max_number : num }
      end

      def get_max_number(array)
        max_number = array[0]
        array.each { |num| max_number = num > max_number ? num : max_number }
        max_number
      end

      def search(array, query)
        iter(0, array.length - 1, array, query)
      end

      def iter(left, right, array, query)
        mid_index = (left + right) / 2
        number = array[mid_index]
        return mid_index if number == query

        return -1 if left >= right
        return iter(left, mid_index, array, query) if number > query

        iter(mid_index + 1, right, array, query)
      end
    end
  end
end
