module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each
        for elem in self do
          yield(elem)
        end
      end

      # Написать свою функцию my_map
      def my_map
        new_arr = MyArray.new
        my_each { |elem| new_arr << yield(elem) }
        new_arr
      end

      # Написать свою функцию my_compact
      def my_compact
        new_arr = MyArray.new
        my_each { |elem| new_arr << elem unless elem.nil? }
        new_arr
      end

      # Написать свою функцию my_reduce
      def my_reduce(initial = nil)
        arr = initial.nil? ? self[1, size] : self
        return initial if arr.nil?

        acc = initial || self[0]

        arr.my_each { |elem| acc = yield(acc, elem) }
        acc
      end
    end
  end
end
