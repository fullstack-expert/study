module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each

        for el in self do
          yield el
        end

        self.class.new self
      end

      # Написать свою функцию my_map
      def my_map
        result = []
        for el in self do
          new_el = yield el
          result << new_el
        end

        self.class.new result
      end

      # Написать свою функцию my_compact
      def my_compact
        result = []
        for el in self do
          if block_given?
            new_el = yield el
            result << new_el
          else
            result << el unless el.nil?
          end
        end

        self.class.new result
      end

      # Написать свою функцию my_reduce
      def my_reduce(initial = nil)
        acc = initial.nil? ?  self[0] : initial

        items = initial.nil? ? self[1..] : self

        for el in items do
          acc = yield acc, el
        end

        acc
      end
    end
  end
end
