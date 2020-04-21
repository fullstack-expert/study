module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each
        iterate(0) { |element| yield(element) }

        self
      end

      # Написать свою функцию my_map
      def my_map
        my_reduce(MyArray.new) do |acc, element|
          acc << yield(element)
        end
      end

      # Написать свою функцию my_compact
      def my_compact
        new_array = MyArray.new

        my_each do |element|
          new_array << element unless element.nil?
        end

        new_array
      end

      # Написать свою функцию my_reduce
      def my_reduce(acc = nil)
        start_index = 0
        if acc.nil?
          start_index = 1
          acc = first
        end

        iterate(start_index) { |element| acc = yield(acc, element) }

        acc
      end

      def iterate(i, &block)
        return if i == size

        yield(self[i])

        iterate(i + 1, &block)
      end
    end
  end
end
