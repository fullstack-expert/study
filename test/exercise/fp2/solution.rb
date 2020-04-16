module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each(&block)
        i = 0
        while i < self.size
          block.call(self[i])
          i += 1
        end

        self
      end

      # Написать свою функцию my_map
      def my_map(&block)
        new_array = MyArray.new

        self.my_each do |element|
          new_array << block.call(element)
        end

        new_array
      end

      # Написать свою функцию my_compact
      def my_compact
        new_array = MyArray.new

        self.my_each do |element|
          new_array << element unless element.nil?
        end

        new_array
      end

      # Написать свою функцию my_reduce
      def my_reduce(acc = nil, &block)
        i = 0
        if acc.nil?
          i = 1
          acc = self.first
        end

        while i < self.size
          acc = block.call(acc, self[i])
          i += 1
        end

        acc
      end
    end
  end
end
