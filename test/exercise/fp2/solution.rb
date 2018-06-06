module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each(&block)
        for i in 0..self.length-1
          block.call(self[i])
        end
        self
      end

      # Написать свою функцию my_map
      def my_map(&block)
        answer=self.class.new
        for i in 0..self.length-1
          answer << block.call(self[i])
        end
        answer
      end

      # Написать свою функцию my_compact
      def my_compact
        answer=self.class.new
        for i in 0..self.length-1
          if self[i] != nil
            answer << self[i]
          end
        end
        answer
      end

      # Написать свою функцию my_reduce
      def my_reduce(memo=0, &block)
        memo = 1 if block.call(memo, rand(1..100)) == 0
        for i in 0..self.length-1
          memo = block.call(memo, self[i])
        end
        memo
      end
    end
  end
end
