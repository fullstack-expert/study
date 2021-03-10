module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        filtred = array.select do |film|
          film['country'].to_s.split(',').length > 1 && film['rating_kinopoisk'].to_f.positive?
        end
        maped = filtred.map { |film| film['rating_kinopoisk'].to_f }
        sum = maped.reduce(:+)
        count = filtred.length
        sum / count
      end

      # Посчитать количесвто букв 'и' в названиях всех фильмов
      # с рейтингом кинопоиска больше или равным заданному значению
      def chars_count(films, threshold)
        filtred = films.select { |film| film['rating_kinopoisk'].to_f >= threshold }
        maped = filtred.map { |film| film['name'].to_s }
        maped.reduce(0) { |acc, name| acc + name.count('и') }
      end
    end
  end
end
