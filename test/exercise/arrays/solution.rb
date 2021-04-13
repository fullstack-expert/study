module Exercise
  module Arrays
    class << self
      def replace(array)
        new_max = -1
        array.each { |val| new_max = val if val > new_max }
        array.map { |val| val.positive? ? new_max : val }
      end

      def search(array, query)
        recurs = lambda { |arr, target, min_index, max_index|
          if arr.length.positive?
            mid_index = ((min_index + max_index).to_i / 2).to_i
            case arr[mid_index].to_i <=> target
            when 0
              mid_index
            when -1
              if mid_index == max_index
                -1
              else
                min_index = mid_index + 1
                recurs.call(arr, target, min_index, max_index)
              end
            when  1
              if mid_index == min_index
                -1
              else
                max_index = mid_index - 1
                recurs.call(arr, target, min_index, max_index)
              end
            end
          else
            -1
          end
        }
        recurs.call(array, query, 0, array.size - 1)
      end
    end
  end
end
