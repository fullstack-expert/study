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
          if items.length.zero?
            return -1
          end
          half = length / 2
          current = items[half]
          z = last_index - half

          if current == query
            if length.even?
              return z + 1
            else
              return z
            end
          elsif current < query
            if length.even?
              return iter.call(items.slice(half + 1, length), z + 2, last_index)
            else
              return iter.call(items.slice(half + 1, length), z, last_index)
            end
          else
            if length.even?
              return iter.call(items.slice(0, half), first_index, z)
            else
              return iter.call(items.slice(0, half), first_index, z - 1)
            end
          end
        end
        iter.call(array, 0, array.length - 1)
      end
    end
  end
end
