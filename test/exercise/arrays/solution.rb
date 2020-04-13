module Exercise
  module Arrays
    class << self
      def replace(array)
        max_element = array.max
        array.map do |element|
          new_element = element > 0 ? max_element : element
          new_element
        end
      end

      def search(_array, _query)
        0
      end
    end
  end
end
