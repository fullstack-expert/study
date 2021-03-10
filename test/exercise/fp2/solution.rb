module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each
        i = 0
        while i < length
          yield(self[i])
          i += 1
        end
        self
      end

      # Написать свою функцию my_map
      def my_map
        my_reduce(self.class.new) { |acc, v| acc << yield(v) }
      end

      # Написать свою функцию my_compact
      def my_compact
        my_reduce(self.class.new) { |acc, v| v.nil? ? acc : acc << v }
      end

      # Написать свою функцию my_reduce
      def my_reduce(acc = nil)
        my_each { |v| acc = acc.nil? ? v : yield(acc, v) }
        acc
      end
    end
  end
end
