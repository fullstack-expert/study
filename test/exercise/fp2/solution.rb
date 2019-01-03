module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each(&fn)
        for i in self
          fn.call(i)
        end
      end

      # Написать свою функцию my_map
      def my_map(&fn)
        result = []
        for i in self
          result << fn.call(i)
        end
        self.class.new(result)
      end

      # Написать свою функцию my_compact
      def my_compact
        result = []
        for i in self
          result << i if !i.nil?
        end
        self.class.new(result)
      end

      # Написать свою функцию my_reduce
      def my_reduce(init = nil, &fn)
        return nil if self.empty?
        acc = init.nil? ? self.first : init
        tail = init.nil? ? self.drop(1) : self
        for i in tail
          acc = fn.call(acc, i)
        end
        return acc
      end
    end
  end
end
