module Exercise
  module Arrays
    class << self
      def replace(array)
        max = array.max
        array.map do |el|
          if el > 0
            max
          else
            el
          end
        end
      end

      def search(_array, _query)
        if _array.include?(_query)
          _array.index(_query)
        else
          -1
        end
      end
    end
  end
end
