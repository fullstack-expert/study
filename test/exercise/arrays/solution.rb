module Exercise
  module Arrays
    class << self
      def replace(array)
        max = array.max
        array.collect { |num| num >= 0 ? max : num }
      end

      def search(array, query)
        left = -1
        right = array.length
        while right > left + 1
          middle = ((right + left) / 2).floor
          if array[middle] < query
            left = middle
          else
            right = middle
          end
        end
        if right < array.length && array[right] == query
          right
        else
          -1
        end
      end
    end
  end
end
