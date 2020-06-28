module Exercise
  module Arrays
    class << self
      def findMax(arr)
        first, * = arr
        def iter(coll, max)
          first, *rest = coll
          return max if coll.length === 0
          updatedMax = first > max ? first : max
          iter(rest, updatedMax)
        end
        iter(arr, first)
      end

      def replace(array)
        max = findMax(array)
        replaced = []
        array.each do |num|
        newEl = num > 0 ? max : num;
        replaced.push(newEl)
        end
        replaced
      end

      def find_index(arr, query)
        index = 0
        arr.each do |el|
          return index if arr[index] === query
          index += 1
        end
      end

      def search(_array, _query)
        return -1 if !_array.include?(_query)
        iter = proc {
          |arr|
          half = arr.length / 2
          middleIndex = half.integer? ? half : half.round()
          middle = arr[middleIndex]
          return find_index(_array, middle) if  middle === _query
          newArr = middle > _query ? arr[0, middleIndex] : arr[middleIndex + 1, arr.length - 1]
          return iter.call(newArr)
        }
        return iter.call(_array)
      end
    end
  end
end
