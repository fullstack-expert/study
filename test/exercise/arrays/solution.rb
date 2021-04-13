module Exercise
  module Arrays
    class << self
      def replace(array)
        max = find_max(array)
        result = []
        array.each { |e| result.push e >= 0 ? max : e }
        result
      end

      def search(array, query, low = 0, hight = array.length - 1)
        return -1 if low > hight || query < array[low] || query > array[hight]

        mid = low + (hight - low) / 2
        return mid if array[mid] == query

        array[mid] > query ? search(array, query, low, mid - 1) : search(array, query, mid + 1, hight)
      end

      def find_max(array)
        max = -Float::INFINITY
        array.each do |e|
          max = e if e >= max
        end
        max
      end
    end
  end
end
