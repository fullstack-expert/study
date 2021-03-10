module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(films)
        filtered = films.select { |film| film['country'].to_s.split(',').length >= 2 && film['rating_kinopoisk'].to_f.positive? }
        filtered.reduce(0) { |sum, film| sum + film['rating_kinopoisk'].to_f } / filtered.length
      end

      def chars_count(films, threshold)
        filtered = films.select { |film| film['rating_kinopoisk'].to_f >= threshold }
        filtered.reduce(0) { |sum, film| sum + film['name'].count('и') }
      end
    end
  end
end
