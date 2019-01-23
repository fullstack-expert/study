module Exercise
  module Arrays
    class << self
      def replace(array)
        max_el = array.max
        array.map { |el| el > 0 ? max_el : el }
      end

      def search(_array, _query)
        if not _array.include? _query
          return -1
        end
        first_index = 0
        last_index = _array.length - 1
        while first_index <= last_index do
          mid_index = (first_index + last_index + 1) / 2
          mid = _array[mid_index]
          if _query == mid
            return mid_index
          elsif _query > mid
            first_index = mid_index + 1
          else
            last_index = mid_index - 1
          end
        end
      end
    end
  end
end
