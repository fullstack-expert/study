module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each(&fn)
        for i in self
          fn.call(self)
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
      end

      # Написать свою функцию my_reduce
      def my_reduce
      end
    end
  end
end
