module Exercise
  module Arrays
    class << self
      def replace(array)
        array.map {|x| (x > 0) ? array.max : x}
      end

      # _array - отсортированный массив целочисленных элементов
      # не уверен, что будет работать корректно, если не гарантируется уникальность элементов массива
      # алгоритм:
      # 1. находим индекс серединного (+/-) элемента массива
      # 2. проверяем значение на эквивалентность заданному
      # 3. если не эквивалентно, то шаг 1 выполнятся на левой/правой части массива
      def search(_array, _query)
        first = 0
        last = _array.length - 1

        while (first <= last)
          i = (first + last) / 2

          if (_array[i] == _query)
            return i
          end

          if (_array[i] > _query)
            last = i - 1
          else
            first = i + 1
          end
        end

        return -1
      end
    end
  end
end
