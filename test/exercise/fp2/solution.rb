module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each
        for el in self do
          yield(el)
        end
        self
      end

      # Написать свою функцию my_map
      def my_map
        res = MyArray.new([])
        my_each { |el| res.push(yield(el)) }
        res
      end

      # Написать свою функцию my_compact
      def my_compact
        res = MyArray.new([])
        my_each { |el| res.push(el) unless el.nil? }
        res
      end

      # Написать свою функцию my_reduce
      def my_reduce(acc = nil)
        if acc.nil?
          acc = self[0]
          array = self[1..(length - 1)]
        else
          array = self
        end
        array.my_each { |el| acc = yield(acc, el) }
        acc
      end
    end
  end
end
