module Exercise
  module Arrays
    class << self
      def replace(array)
        max = array.max
        array.map { |e| e.positive? ? max : e }
      end

      def search(_array, _query)
        i = 0
        j = _array.length - 1

        while i <= j
          ind = (i + j) / 2
          return ind if _array[ind] == _query

          if _query > _array[ind]
            i = ind + 1
          else
            j = ind - 1
          end
        end

        -1
      end
    end
  end
end
