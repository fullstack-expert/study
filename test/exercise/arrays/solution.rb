module Exercise
  module Arrays
    class << self
      def replace(array)
        max_number = search_max_number(array)
        new_array = []

        array.each do |number|
          if number.positive?
            new_array.push(max_number)
          else
            new_array.push(number)
          end
        end
        new_array
      end

      def search(array, query)
        return -1 if array.empty?

        bsearch = lambda { |array2, index|
          if array2.length == 1
            return array2.first == query ? index : -1
          end

          if query <= array2[array2.length / 2 - 1]
            bsearch.call(array2[0, array2.length / 2], index)
          else
            bsearch.call(array2[array2.length / 2, array2.length], index + array2.length / 2)
          end
        }
        bsearch.call(array, 0)
      end

      private

      def search_max_number(numbers)
        max_number = 0

        numbers.each do |number|
          max_number = number if number > max_number
        end
        max_number
      end
    end
  end
end
