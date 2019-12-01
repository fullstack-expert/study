module Exercise
  module Arrays
    class << self
      def my_max(array)
        array.reduce(0) do |acc,elem|
        acc < elem ? elem : acc
        end
      end 

      def replace(array)
        array.map do |num|
          num > 0 ? my_max(array) : num
      end
  end
  

  def search(array, num, low=0, high=array.length-1)  
      return -1 if low > high  
      mid = (low + high) / 2  
      return mid if array[mid]==num 
      if array[mid] > num  
        high = mid - 1  
      else  
        low = mid + 1  
      end  
      search(array, num, low, high)   
      end  

    end
  end
end
