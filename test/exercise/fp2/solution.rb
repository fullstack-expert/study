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
      def my_map(&func)
        return self if empty?
        add_in_arr = ->(arr, el) { arr << func.call(el) }
        MyArray.new(my_reduce([], &add_in_arr))
      end

      # Написать свою функцию my_compact
      def my_compact
        func = ->(arr, el) { el.nil? ? arr : arr << el }
        MyArray.new(my_reduce([], &func))
      end

      # Написать свою функцию my_reduce
      def my_reduce(acc = nil, &func)
        return acc if empty?
        drop(1).my_reduce(acc ? func.(acc, first) : first, &func)
      end

    end
  end
end
