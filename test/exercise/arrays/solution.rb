module Exercise
  module Arrays
    class << self
      def replace(array)
        return if array.empty?

        max = array[0]
        1.upto(array.size - 1) do |i|
          max = array[i] if max < array[i]
        end

        result = []
        array.each do |item|
          result << (item.positive? ? max : item)
        end
        result
      end

      def search(array, element)
        bs_iter = lambda do |array_slice, indexes|
          return -1 if array_slice.empty?

          middle_item_index = indexes.size / 2
          middle_element = array_slice[middle_item_index]

          return indexes[middle_item_index] if element == middle_element

          left_bound_index = 0
          right_bound_index = indexes[-1]
          return -1 if left_bound_index == right_bound_index

          if element > middle_element
            left_bound_index = middle_item_index + 1
          elsif element < middle_element
            right_bound_index = middle_item_index - 1
          end
          return bs_iter.call(
            array_slice[left_bound_index..right_bound_index],
            indexes[left_bound_index..right_bound_index]
          )
        end

        indexes = (0..array.size - 1).to_a
        bs_iter.call(array, indexes)
      end
    end
  end
end
