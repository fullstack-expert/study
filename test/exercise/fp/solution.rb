module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(films)
        filtered =
          films
          .by_row
          .select { |film| film['rating_kinopoisk'].to_f > 0.0 }
          .select { |film| film['country'].to_s.split(',').length >= 2 }
          .map { |film| film['rating_kinopoisk'].to_f }

        sum = filtered.reduce(0, &:+)

        sum / filtered.length
      end

      def chars_count(films, threshold)
        films
          .by_row
          .select { |film| film['rating_kinopoisk'].to_f > threshold }
          .map { |film| film['name'] }
          .map { |name| name.count('и') }
          .sum
      end
    end
  end
end
