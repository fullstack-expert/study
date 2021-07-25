module Exercise
  module Arrays
    class << self
      def replace(array)
        maximum = array.reduce { |acc, el| acc > el ? acc : el }
        array.map { |el| el.positive? ? maximum : el }
      end

      def search(array, query)
        index = (array.length - 1) / 2

        return -1 if array.length.zero? || (array.length == 1 && array[index] != query)

        if query == array[index]
          index
        elsif query > array[index]
          acc = search(array[index + 1, array.length], query)
          acc == -1 ? -1 : index + 1 + acc
        else
          search(array[0, index], query)
        end
      end
    end
  end
end
