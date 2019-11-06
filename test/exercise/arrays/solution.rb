module Exercise
  module Arrays
    class << self
      def replace(array)
        array.map { |x| x > 0 ? array.max : x }
      end

      def search(array, query)
        index = array.index(query)
        index.nil? ? -1 : index
      end
    end
  end
end
