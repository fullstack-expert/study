module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        selected_rating = array.select { |film| !film['rating_kinopoisk'].nil? && !film['country'].nil? && !film['rating_kinopoisk'].to_f.zero? }
        rating = selected_rating.select { |film| film['country'].split(',').size >= 2 }.map { |film| film['rating_kinopoisk'].to_f }

        rating.reduce(:+) / rating.size
      end

      def chars_count(films, threshold)
        films.select { |film| film['rating_kinopoisk'].to_f >= threshold }.map { |film| film['name'].scan('и').count }.reduce(:+)
      end
    end
  end
end
