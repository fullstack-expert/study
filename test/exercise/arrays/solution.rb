module Exercise
  module Arrays
    class << self
      def replace(array)
        replacer = max(array)
        last_index = array.size - 1

        iter = -> (arr, current_index) {
          current = arr[current_index]

          arr[current_index] = current.positive? ? replacer : current

          return  current_index == last_index ? arr : iter.call(arr, current_index + 1)
        }

        iter.call(array, 0)
      end

      def search(array, query)
        return -1 if array.empty?

        low = 0
        high = array.size - 1

        while low <= high
          mid = (low + high).ceil
          if array[mid] == query
            return mid
          end

          if query < array[mid]
            high = mid - 1
          else
            low = mid + 1
          end
        end

        return -1
      end

      def max(array)
        iter = -> (arr, acc) {
          return acc if arr.empty?
          tmp = arr.first
          newAcc = acc > tmp ? acc : tmp
          return iter.call(arr[1..], newAcc)
        }

        iter.call(array, array.first)
      end
    end
  end
end
