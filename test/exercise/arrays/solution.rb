module Exercise
  module Arrays
    class << self
      def replace(array)
        array.map { |item| item > 0 ? array.max : item }
      end

      def search(array, query)
        array.bsearch_index { |item| query <=> item } || -1
      end
    end
  end
end
