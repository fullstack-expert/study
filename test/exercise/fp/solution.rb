module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        sorted_films = array.select { |film| film['rating_kinopoisk'].to_f.positive? && !film['country'].nil? && film['country'].split(',').count > 1 }
        overall_rating = sorted_films.map { |film| film['rating_kinopoisk'].to_f }.reduce(:+)
        overall_rating / sorted_films.count
      end

      def chars_count(films, threshold)
        sorted_films = films.select { |film| film['rating_kinopoisk'].to_f >= threshold }
        sorted_films.map { |film| film['name'].count('и') }.reduce(:+)
      end
    end
  end
end
