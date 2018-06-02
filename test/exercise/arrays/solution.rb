module Exercise
  module Arrays
    class << self
      def replace(array)
        max = array[0]

        def findMax(value, max)
          if value > max
            max = value
          end
          return max
        end

        for i in 0..(array.length()-1)
          max = findMax(array[i],max)
        end

        for i in 0..(array.length()-1)
          if array[i]>0
            array[i] = max
          end
        end

        array
      end

      def search(_array, _query)
        0
      end
    end
  end
end
