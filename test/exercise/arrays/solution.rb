module Exercise
  module Arrays
    class << self
      def replace(array)
        max = array.reduce do |acc, n|
          acc > n ? acc : n
        end
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
