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

      def search(array, query)
        right = array.length()-1
        if right < 0
          return -1
        end
        if right == 0
          if array[right] == query
            return right
          else return -1
          end
        end

        left=0

        while right >= left

          if right == left
            if array[right] == query
              return right
            else return -1
            end
          end

          center = (right+left).div 2

          if array[center] == query
            return center
          elsif array[center] > query
            right = center - 1
          else
            left = center +1
          end

        end
      end
    end
  end
end
