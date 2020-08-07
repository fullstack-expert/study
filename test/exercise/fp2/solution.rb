module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each(&block)
        each = lambda { |array|
          return self if array.my_empty?

          block.call(array[0])
          each.call(array[1, array.length])
        }
        each.call(self)
      end

      # Написать свою функцию my_map
      def my_map(&block)
        func = ->(acc, element) { acc << block.call(element) }

        my_reduce(MyArray.new, &func)
      end

      # Написать свою функцию my_compact
      def my_compact
        func = ->(acc, element) { element.nil? ? acc : acc << element }

        my_reduce(MyArray.new, &func)
      end

      # Написать свою функцию my_reduce
      def my_reduce(acc = nil, &block)
        my_each { |element| acc = acc.nil? ? element : block.call(acc, element) }

        acc
      end

      def my_empty?
        length == 0
      end
    end
  end
end
