module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(films)
        array_films = films.to_a.slice(1, films.count)

        filtered =
          array_films
          .select { |film| film[1].to_f > 0.0 }
          .select { |film| film[6].to_s.split(',').length >= 2 }
          .map { |film| film[1].to_f }

        sum = filtered.reduce(0, &:+)

        sum / filtered.length
      end

      def chars_count(films, threshold)
        array_films = films.to_a.slice(1, films.count)

        filtered =
          array_films
          .select { |film| film[1].to_f > threshold }
          .map { |film| film[0] }

        filtered.reduce(0) { |a, e| a + count(e, 'и') }
      end

      def count(str, symbol)
        str.split('').count(symbol)
      end
    end
  end
end
