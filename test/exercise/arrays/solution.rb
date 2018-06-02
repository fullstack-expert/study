module Exercise
  module Arrays
    class << self
      def replace(array)
        array.map {|x| (x > 0) ? array.max : x}
      end

      def search(_array, _query)
        0
      end
    end
  end
end
