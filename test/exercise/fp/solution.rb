module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(_array)
        i = 0
        sumOfRating = _array.reduce(0) { |memo, film|
          rating = film["rating_kinopoisk"].to_f
          country = film["country"]
          numOfCountries = country.nil? ? 0 : country.split(',').length

          if rating > 0 && numOfCountries > 1
            memo += rating
            i += 1
          end
          memo
        }
        return sumOfRating / i
      end

      def chars_count(_films, _threshold)
        countOfChars = 0
        _films.map { |film|
          rating = film["rating_kinopoisk"].to_f
          if rating >= _threshold
            countOfChars += film['name'].chars.reduce(0) { |acc, char|
                acc = char == 'и' ? acc += 1 : acc
            }
          end
        }
        return countOfChars
      end
    end
  end
end
