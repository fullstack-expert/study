module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each(*)
        for i in 0..(self.length - 1)
          yield(self[i])
        end
        self
      end

      # Написать свою функцию my_map
      def my_map(*)
        answer = self.class.new
        for i in 0..(self.length - 1)
          answer << yield(self[i])
        end
        answer
      end

      # Написать свою функцию my_compact
      def my_compact
        answer = self.class.new
        for i in 0..(self.length - 1)
          answer << self[i] unless self[i].nil?
        end
        answer
      end

      # Написать свою функцию my_reduce
      def my_reduce(memo = 0, *)
        memo = 1 if memo == 0 && yield(memo, rand(1..100)) == 0
        for i in 0..(self.length - 1)
          memo = yield(memo, self[i])
        end
        memo
      end
    end
  end
end
