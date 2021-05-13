module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each(&func)
        first, *rest = self
        rest = MyArray.new(rest)
        yield first
        return if rest.empty?

        rest.my_each(&func)
        self
      end

      # Написать свою функцию my_map
      def my_map(&block)
        new_array = MyArray.new
        my_reduce(new_array) { |acc, el| acc << block.call(el) }
        new_array
      end

      # Написать свою функцию my_compact
      def my_compact
        my_reduce(MyArray.new) do |acc, el|
          acc << el unless el.nil?
          acc
        end
      end

      # Написать свою функцию my_reduce
      def my_reduce(acc = nil)
        my_each { |item| acc = acc.nil? ? item : yield(acc, item) }
        acc
      end
    end
  end
end
