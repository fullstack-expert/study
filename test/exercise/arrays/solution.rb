module Exercise
  module Arrays
    class << self
      def replace(array)
      	max = array.max
	array.map! {|item| if item > 0 then max else item end}
        array
      end

      def search(_array, _query)
        unless _array.any?(_query)
	  -1
	else
	  _array.index(_query)
	end
      end
    end
  end
end
