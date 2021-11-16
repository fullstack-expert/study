module Exercise
  module Arrays
    class << self
      def replace(array)
        max = array.reduce { |acc, el| acc > el ? acc : el }

        array.map { |el| el.positive? ? max : el }
      end

      def search(array, query)
        return -1 if array.empty?

        array.each.with_index do |v, k|
          return k.to_i if v == query
        end

        return -1
      end
    end
  end
end
