module Exercise
  module Arrays
    class << self
      def replace(array)
        max = array.max
        array.map do |el|
          el > 0 ? max : el
        end
      end

      def search(array, query)
        array.include?(query) ? array.index(query) : -1
      end
    end
  end
end
