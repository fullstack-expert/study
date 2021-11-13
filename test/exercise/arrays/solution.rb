module Exercise
  module Arrays
    class << self
      def replace(array)
        max = array.reduce { |acc, element| acc > element ? acc : element }
        array.map { |element| element.positive? ? max : element }
      end

      def bin_search(arr, targ, min_ind, max_ind)
        mid_ind = (max_ind + min_ind) / 2
        return -1 if arr.empty? || (targ > arr[max_ind]) || (targ < arr[min_ind])

        return mid_ind if targ == arr[mid_ind]

        if targ > arr[mid_ind]
          bin_search(arr, targ, mid_ind + 1, max_ind)
        elsif targ < arr[mid_ind]
          bin_search(arr, targ, min_ind, mid_ind - 1)
        end
      end

      def search(array, query)
        min_ind = 0
        max_ind = array.length - 1
        bin_search(array, query, min_ind, max_ind)
      end
    end
  end
end
