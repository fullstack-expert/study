module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(films)
        filter_films = films.select { |film| film['country'] && film['country'].include?(',') && !film['rating_kinopoisk'].to_f.zero? }
        raiting = filter_films.map { |film| film['rating_kinopoisk'].to_f }
        raiting.reduce(:+) / raiting.count
      end

      def chars_count(films, threshold)
        list_films = films.select { |film| film['rating_kinopoisk'].to_f >= threshold }
        array_count = list_films.map { |film| film['name'].scan('и').count }
        array_count.sum
      end
    end
  end
end
