module Exercise
  module Arrays
    class << self
      def replace(array)        
        maxValue = array.max
        newArray = array.map {|num|
             if num > 0
                num = maxValue
             else mum = num
             end}
        return newArray         
      end

      def search(_array, _query)
        indexArray =_array.bsearch_index {|x| _query <=> x } 
        if indexArray == nil
          return -1        
        else
          return indexArray        
        end
      end
    end
  end
end
