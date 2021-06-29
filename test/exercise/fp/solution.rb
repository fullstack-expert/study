module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        films = array
          .filter { |film| film['rating_kinopoisk'].to_f > 0 and film['country'].to_s.split(',').count > 1 }

        rating = films.map { |film| film['rating_kinopoisk'].to_f }.reduce(:+)

        rating / films.count
      end

      def chars_count(films, threshold)
        films
          .filter { |film| film['rating_kinopoisk'].to_f >= threshold if film['rating_kinopoisk'] and film['name'] }
          .map { |film| film["name"].count("и") }
          .reduce(:+)
      end
    end
  end
end
