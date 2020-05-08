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
        my_reduce([]) {|ar, el| ar.push(yield(el))}
      end

      # Написать свою функцию my_compact
      def my_compact
        my_reduce([]) {|ar, el| ar << el if el != nil}  
      end

      # Написать свою функцию my_reduce
      def my_reduce (res = nil)
        my_each do |elem|
          next res = elem if res.nil?
          yield(res, elem)   
        end
        res
      end
    end
  end
end
