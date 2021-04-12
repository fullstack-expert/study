module Exercise
  module Arrays
    class << self
      def replace(array)
        max = array.reduce { |largest, current| largest > current ? largest : current }
        array.map { |n| n.positive? ? max : n }
      end

      def search(array, query)
        if array.empty?
          -1
        else
          start = 0
          finish = array.length - 1
          iter(start, finish, array, query)
        end
      end

      def iter(start, finish, array, query)
        middle = (start + finish) / 2

        return middle if array[middle] == query

        return -1 if start == finish

        return iter(middle + 1, finish, array, query) if array[middle] < query

        iter(start, middle - 1, array, query)
      end
    end
  end
end
