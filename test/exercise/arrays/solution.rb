module Exercise
  module Arrays
    class << self
      def replace(array)
        replacer = max(array)
        last_index = array.size - 1

        iter = lambda do |arr, current_index|
          current = arr[current_index]

          arr[current_index] = current.positive? ? replacer : current

          return current_index == last_index ? arr : iter.call(arr, current_index + 1)
        end

        iter.call(array, 0)
      end

      def search(array, query)
        iter = lambda do |low, high|
          return -1 if high < low

          guess = (low + high) / 2

          case array[guess] <=> query
          when 0
            guess
          when -1
            low = guess + 1
            iter.call(low, high)
          when 1
            high = guess - 1
            iter.call(low, high)
          end
        end

        low = 0
        high = array.size - 1

        iter.call(low, high)
      end

      def max(array)
        iter = lambda do |arr, acc|
          return acc if arr.empty?

          tmp = arr.first
          new_acc = acc > tmp ? acc : tmp

          return iter.call(arr.slice(1, arr.size - 1), new_acc)
        end

        iter.call(array, array.first)
      end
    end
  end
end
