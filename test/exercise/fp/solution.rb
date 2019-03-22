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

        le = new_array.length

        result = new_array.reduce(:+)

        return result/le
      end

      def chars_count(films, threshold)
        count = 0

        films.map do |film|
          if(film["rating_kinopoisk"].to_f >= threshold)
            film["name"].each_char {|char|
              char == 'и' && count += 1
            }
          end
        end

        return count
      end
    end
  end
end

















