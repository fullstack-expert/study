module Exercise
  module Arrays
    class << self
      def replace(array)
        max = array.max
        for i in 0..array.length - 1
          array[i] = max if array[i] > 0
        end
        array
      end

      def search(_array, _query)
        0
      end
    end
  end
end
