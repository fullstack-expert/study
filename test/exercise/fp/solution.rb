module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        i = 0

        sum_of_rating = array.reduce(0) do |memo, film|
          rating = film['rating_kinopoisk'].to_f
          country = film['country']
          count_countries = country.nil? ? 0 : country.split(',').length

          if rating > 0 && count_countries > 1
            memo += rating
            i += 1
          end
          memo
        end
        sum_of_rating / i
      end

      def chars_count(films, threshold)
        count_chars = 0

        films.map do |film|
          if film['rating_kinopoisk'].to_f >= threshold
            count_chars += film['name'].chars.reduce(0) { |a, e| e == 'и' ? a += 1 : a }
          end
        end
        count_chars
      end
    end
  end
end
