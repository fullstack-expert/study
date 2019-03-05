module Exercise
  module Arrays
    class << self
      def replace(array)
        new_array = positive_to_max(array)
        puts new_array
        new_array
      end
      def positive_to_max(array)
        max = array.max
        array.map do |n|
          n > 0 ? max : n
        end
      end
      
      def search(array, query)
        
        if array.length == 0
          return - 1
        end  
        left = 0
        right = array.length
        mid = 0
        

       while left < right
         mid = left + ((right - left) / 2).ceil
       
         if array[mid] == query
              return mid
          end 
         return -1 if right == 0 || left == array.length - 1
      
          if array[mid] > query
              right = mid
          else
              left = mid + 1
        
          end
        end
        -1
      end  
    end
  end
end 
