module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each
        for element in self
          yield element
        end
      end

      # Написать свою функцию my_map
      def my_map
        arr = self.class.new
        my_each { |element| arr << yield(element) }
        arr
      end

      # Написать свою функцию my_compact
      def my_compact
        arr = self.class.new
        my_each { |element| arr << element unless element.nil? }
        arr
      end

      # Написать свою функцию my_reduce
      def my_reduce(init = nil)
        acc = init
        my_each do |element|
          if acc.nil?
            acc = element
          else 
            acc = yield(acc, element)
          end
        end
        acc
      end
    end
  end
end
