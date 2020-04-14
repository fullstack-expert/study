module Exercise
  module Arrays
    class << self
      def replace(array)
        max_value = array.max

        array.map do |item|
          if item >= 0
            max_value
          else
            item
          end
        end
      end

      def search(array, query)
        iter = lambda do |items, first_index, last_index|
          length = items.length
          return -1 if items.length.zero?
          if length.even?
            half = length / 2 - 1
            z = last_index - half - 1
          else
            half = length / 2
            z = last_index - half
          end
          current = items[half]

          return z if current == query

          return iter.call(items.slice(half + 1, length), z + 1, last_index) if current < query

          iter.call(items.slice(0, half), first_index, z - 1)
        end
        iter.call(array, 0, array.length - 1)
      end
    end
  end
end
