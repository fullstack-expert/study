module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        new_array = []

        array.map do |film|

          if(film["rating_kinopoisk"].to_f.positive? &&
              film["country"] != nil &&
              film["country"].split(',').length >= 2
          )
            new_array.push(film["rating_kinopoisk"].to_f)

          end
        end

        arr_length = new_array.length
        result = new_array.reduce(:+)

        return result/arr_length
      end

      def chars_count(films, threshold)
        count = 0

        films.map do |film|

          if(film["rating_kinopoisk"].to_f >= threshold)
            arr = film["name"].split('')

            count += arr.reduce(0) {|sum, char|
              (char == 'и') && sum += 1
              sum
            }
          end
        end

        return count
      end
    end
  end
end

















