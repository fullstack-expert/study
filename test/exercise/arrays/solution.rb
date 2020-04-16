module Exercise
  module Arrays
    class << self
      def replace(array)
        max_value = max(array)

        array.map do |item|
          item >= 0 ? max_value : item
        end
      end

      def search(array, query)
        iter = lambda do |items, first_index, last_index|
          length = items.length
          return -1 if items.length.zero?

          half = length / 2
          z = length.even? ? (last_index - half + 1) : (last_index - half)

          current = items[half]

          return z if current == query

          return iter.call(items.slice(half + 1, length), z + 1, last_index) if current < query

          iter.call(items.slice(0, half), first_index, z - 1)
        end
        iter.call(array, 0, array.length - 1)
      end

      def max(array)
        array.reduce do |acc, value|
          acc < value ? value : acc
        end
      end
    end
  end
end
