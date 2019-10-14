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
        arr = MyArray.new
        for e in self
          arr.push(yield(e))
        end
        arr
      end

      # Написать свою функцию my_compact
      def my_compact
        arr = MyArray.new
        for e in self
          arr.push(e) unless e.nil?
        end
        arr
      end

      # Написать свою функцию my_reduce
      def my_reduce(accum = nil)
        self.my_each { |e| accum = accum ? yield(accum, e) : e }
        accum
      end
    end
  end
end
