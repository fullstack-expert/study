module Exercise
  module Arrays
    class << self
      def replace(array)
        max_val = array.max
        new_array = []
        array.map do |i|
          new_array.push(i > 0 ? max_val : i)
        end
        new_array
      end

      def search(_array, _query)
        arr_index = _array.index(_query)
        arr_index.nil? ? -1 : arr_index
      end
    end
  end
end
