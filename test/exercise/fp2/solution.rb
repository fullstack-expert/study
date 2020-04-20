module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each
        for item in self do
          yield item 
        end
      end

      # Написать свою функцию my_map
      def my_map
        array = MyArray.new
        my_each {|el| array << yield(el)}
      end

      # Написать свою функцию my_compact
      def my_compact
        array = MyArray.new
        my_each {|el| array << el if el != nil} 
        array
      end

      # Написать свою функцию my_reduce
      def my_reduce (res = nil)
        if res == nil
          res = self[0]
          n = 1
        else
          n = 0
        end
        while n < self.length do 
          res = yield(res, self[n])
          n += 1
        end
        res
      end
    end
  end
end
