module Exercise
  module Arrays
    class << self
      def replace(array)
        array.map { |i| i.positive? ? array.max : i }
      end

      def search(arr, qry)
        idx_start = 0
        idx_end = arr.length
        loop do
          len = idx_end - idx_start
          return arr[idx_start] == qry ? idx_start : -1 if len < 2

          idx_cen = len / 2 + idx_start
          if arr[idx_cen] > qry
            idx_end = idx_cen
          else
            idx_start = idx_cen
          end
        end
      end
    end
  end
end
