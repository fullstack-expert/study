module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each
        for e in self
          yield e
        end
      end

      # Написать свою функцию my_map
      def my_map
        res = MyArray.new
        for e in self
          res.push yield(e)
        end
        res
      end

      # Написать свою функцию my_compact
      def my_compact
        res = MyArray.new
        for e in self
          res.push(e) unless e.nil?
        end
        res
      end

      # Написать свою функцию my_reduce
      def my_reduce(acc = nil)
        for e in self
          acc = acc ? yield(acc, e) : e
        end
        acc
      end
    end
  end
end
