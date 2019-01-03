module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each
        for x in self
          yield(x)
        end
      end

      # Написать свою функцию my_map
      def my_map
        new_map_array = MyArray.new
        for x in self
          new_map_array.push(yield(x))
        end
        new_map_array
      end

      # Написать свою функцию my_compact
      def my_compact
        new_compact_array = MyArray.new
        for x in self
          new_compact_array.push(x) unless x.nil?
        end
        new_compact_array
      end

      # Написать свою функцию my_reduce
      def my_reduce(acc = nil)
        for x in self
          acc = acc ? yield(acc, x) : x
        end
        acc
      end
    end
  end
end
