module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each(&func)
        array = self
        return array if array.empty?

        head, *tail = array

        yield head

        MyArray.new(tail).my_each(&func)
        array
      end

      # Написать свою функцию my_map
      def my_map
        func = ->(acc, el) { acc << yield(el) }
        empty_arr = MyArray.new
        my_reduce(empty_arr, &func)
      end

      # Написать свою функцию my_compact
      def my_compact
        func = ->(acc, el) { el.nil? ? acc : acc << el }
        empty_arr = MyArray.new
        my_reduce(empty_arr, &func)
      end

      # Написать свою функцию my_reduce
      def my_reduce(acc = nil)
        arr = self
        my_each { |el| acc.nil? ? acc = arr.first : acc = yield(acc, el) }
        acc
      end
    end
  end
end
