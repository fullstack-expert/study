module Exercise
  module Arrays
    class << self
      def replace(array)
        array.map {|number| (number.positive? && number != array.max) ? array.max : number}
      end

      def search(_array, _query)
        0
      end
    end
  end
end
