module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each(&block)
        if block
          self.size.times do |ix|
            block.(self[ix])
          end
        end
        self
      end

      # Написать свою функцию my_map
      def my_map(&block)
        MyArray.new(self.size) { |ix| block.(self[ix]) } if block
      end

      # Написать свою функцию my_compact
      def my_compact
        temp = MyArray.new
        self.my_each do |x|
          temp << x unless x.nil?
        end
        temp
      end

      # Написать свою функцию my_reduce
      def my_reduce(acc = nil, &block)
        total = if acc.nil?
            block.(0, 1) == 0 ? 1 : 0
          else
            acc
          end

        self.my_each do |val|
          total = block.(total, val)
        end

        total
      end
    end
  end
end
