module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        filtered_films = array.select do |film|
          film['rating_kinopoisk'].to_f.positive? && film['country'].to_s.split(',').count > 1
        end

        ratings_sum = filtered_films.reduce(0) { |sum, film| sum + film['rating_kinopoisk'].to_f }

        ratings_sum / filtered_films.count
      end

      def chars_count(films, threshold)
        filtered_films = films.select { |film| film['rating_kinopoisk'].to_f >= threshold }

        filtered_films.reduce(0) { |sum, film| sum + film['name'].scan(/и/).count }
      end
    end
  end
end