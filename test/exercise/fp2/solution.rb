module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each
        index = 0
        length = self.length

        loop do
          break if index == length

          yield(self[index])
          index += 1
        end

        self
      end

      # Написать свою функцию my_map
      def my_map
        new_array = MyArray.new

        my_each do |i|
          new_array << yield(i)
        end

        new_array
      end

      # Написать свою функцию my_compact
      def my_compact
        index = 0
        length = self.length
        new_array = MyArray.new

        loop do
          break if index == length

          if block_given?
            block_result = yield(self[index])
            new_array << block_result if block_result
          else
            self[index].nil? ? new_array : new_array << self[index]
          end

          index += 1
        end

        new_array
      end

      # Написать свою функцию my_reduce
      def my_reduce(acc = nil)
        length = self.length

        if acc
          index = 0
        else
          index = 1
          acc = first
        end

        loop do
          break if index == length

          acc = yield(acc, self[index])
          index += 1
        end

        acc
      end
    end
  end
end
