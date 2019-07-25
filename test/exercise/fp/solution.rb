module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        arr = array.select { |film| film['country'].to_s.split(',').length > 1 && film['rating_kinopoisk'].to_f > 0 }
             .map { |film| film['rating_kinopoisk'].to_f }
        arr.reduce(:+) / arr.length
      end

      def chars_count(films, threshold)
        films.select { |film| film['rating_kinopoisk'].to_f >= threshold }
             .map { |film| film['name'].count('и') }.reduce(:+)
      end
    end
  end
end
