module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each
        for elelement in self
          yield elelement
        end
      end

      # Написать свою функцию my_map
      def my_map
        result = MyArray.new
        my_each { |elelement| result << yield(elelement) }
        result
      end

      # Написать свою функцию my_compact
      def my_compact
        result = MyArray.new
        my_each { |elelement| result << elelement unless elelement.nil? }
        result
      end

      # Написать свою функцию my_reduce
      def my_reduce(acc = nil)
        my_each { |elelement| acc = acc.nil? ? elelement : yield(acc, elelement) }
        acc
      end
    end
  end
end
