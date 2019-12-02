module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]

      def rating(array)
        sort_array = array.find_all { |film| film['country'].to_s.include?(',') && film['rating_kinopoisk'].to_f > 0 && !film['rating_kinopoisk'].nil? }
        rating = sort_array.map { |film| film['rating_kinopoisk'].to_f }
        sum = rating.reduce(0) { |sum, num| sum + num }
        sum / rating.length
      end

      def chars_count(films, threshold)
        sort_array = films.find_all { |film| film['rating_kinopoisk'].to_f >= threshold.to_f }
        sort_by_name = sort_array.map { |film| film['name'] }
        sort_by_name.reduce(0) { |sum, film| sum + film.count('и') }
      end
    end
  end
end

#   Посчитать количесвто букв 'и' в названиях всех фильмов с рейтингом кинопоиска больше или равным заданному значению
