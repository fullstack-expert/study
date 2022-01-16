module Exercise
  module Arrays
    class << self
      def get_max(arr)
        array = arr.clone
        n = array.length
        loop do
          swapped = false

          (n - 1).times do |i|
            if array[i] > array[i + 1]
              array[i], array[i + 1] = array[i + 1], array[i]
              swapped = true
            end
          end

          break unless swapped
        end

        array[-1]
      end

      def replace(array)
        array.map do |el|
          el.positive? ? get_max(array) : el
        end
      end

      def search(arr, query)
        return -1 if arr.length.zero?
        return -1 if query < arr.first || query > arr.last

        recurse(arr, query, 0, arr.size - 1)
      end

      def recurse(arr, target, low, high)
        mid = (low + high) / 2
        case target <=> arr[mid]
        when 0
          guess = mid
        when -1
          guess = if low == mid
                 -1
               else
                 recurse(arr, target, low, mid - 1)
               end
        when 1
          guess = if high == mid
                 -1
               else
                 recurse(arr, target, mid + 1, high)
               end
        end

        guess
      end
    end
  end
end
