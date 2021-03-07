module Exercise
  module Arrays
    class << self
      def replace(array)
        arr = []
        for el in array
          arr << 100 if el >= 0
          arr << el if el.negative?
        end
        arr
      end

      def search(array, query)
        return -1 unless array.include? query

        array.index(query)
      end
    end
  end
end
