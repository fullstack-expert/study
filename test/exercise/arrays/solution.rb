module Exercise
  module Arrays
    class << self
      def replace(array)
        max_el = array.inject(array[0]) { |el, acc| el > acc ? el : acc }
        array.map { |el| el.positive? ? max_el : el }
      end

      def search(array, query)
        iter = lambda do |part, from|
          return -1 if part.empty?

          mid = part.length / 2
          guess = part[mid]
          return from + mid if guess == query

          if query < guess
            iter.call(part[0..(mid - 1)], from)
          else
            iter.call(part[(mid + 1)..], from + mid + 1)
          end
        end

        iter.call(array, 0)
      end
    end
  end
end
