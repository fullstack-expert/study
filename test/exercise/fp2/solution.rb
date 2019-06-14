module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each
        i = 0
        while i < self.length
          yield self[i]
          i += 1
        end
        self
      end

      # Написать свою функцию my_map
      def my_map
        newArr = MyArray.new
        my_each do |item|
          newArr << yield(item)
        end
        newArr
      end

      # Написать свою функцию my_compact
      def my_compact
        newArr = MyArray.new
        my_each { |item| newArr << item if item != nil }
        newArr
      end

      # Написать свою функцию my_reduce
      def my_reduce (default = nil)
        i = 0
        result = default
        while i < self.length
          result = result.nil? ? self[i] : yield(result, self[i])
          i += 1
        end
        result
      end
    end
  end
end
