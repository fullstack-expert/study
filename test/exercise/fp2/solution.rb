module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each
        for item in self do yield(item) end
      end

      # Написать свою функцию my_map
      def my_map
        result = []

        func = -> (item) { result << yield(item) }
        self.my_each(&func)

        self.class.new(result)
      end

      # Написать свою функцию my_compact
      def my_compact
        result = []

        func = -> (item) { result << item if !item.nil? }
        self.my_each(&func)

        self.class.new(result)
      end

      # Написать свою функцию my_reduce
      def my_reduce(accumulator = nil, &block)
        if (accumulator.nil?)
            accumulator = self.first
            list = self[1..-1]
        else
            list = self
        end

        list.my_each do |element|
          accumulator = block.call(accumulator, element) if !element.nil?
        end
        accumulator
      end
    end
  end
end
