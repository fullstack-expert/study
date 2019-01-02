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
        _films.reduce(0) { |memo, film|
          rating = film["rating_kinopoisk"].to_f
          if rating >= _threshold
            memo = memo + film['name'].chars.reduce(0) { |count_chars, char|
                count_chars = char == 'и' ? count_chars += 1 : count_chars
            }
          end
          memo
        }
      end
    end
  end
end
