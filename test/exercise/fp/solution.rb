module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(_array)
        i = 0
        sumOfRating = _array.reduce(0) { |memo, film|
          rating = film["rating_kinopoisk"]
          country = film["country"]
          numOfCountries = country.nil? ? 0 : country.split(',').length

          if rating.nil? || rating.to_f == 0 || numOfCountries < 2
            next memo
          end

          i += 1
          memo += rating.to_f
        }
        return sumOfRating / i
      end

      def chars_count(_films, _threshold)
        0
      end
    end
  end
end
