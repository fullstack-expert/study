module Exercise
  module Arrays
    class << self
      def replace(array)
        array.map { |x| x.positive? ? 100 : x }
      end

      def search(_array, _query)
        _array.each do |x|
          return _array.find_index(x) if x == _query
        end
        -1
      end
    end
  end
end
