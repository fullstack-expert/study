module Exercise
  module Arrays
    class << self
      def replace(array)
        max = array.max
        array.map {|x| x > 0 ? max : x }
      end

      def search(_array, _query)

        if(_array.empty?)
          return -1
        end

        res = _array.index(_query)
        
        if(res.nil?)
          return -1
        else
          return res
        end
      end
    end
  end
end
