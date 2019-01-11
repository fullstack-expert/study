module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        filtred = array.select do |film|
          count = film['country'].nil? ? 0 : film['country'].split(',').collect(&:strip).count
          count >= 2 && film['rating_kinopoisk'].to_f > 0
        end

        ratings = filtred.map { |el| el['rating_kinopoisk'].to_f }

        sum = ratings.reduce(0) { |a, e| a + e }

        sum / ratings.count
      end

      def chars_count(films, threshold)
        filtred = films.select { |film| film['rating_kinopoisk'].to_f >= threshold }

        names = filtred.map { |film| film['name'] }

        names.reduce(0) do |acc, name|
          name.include?('и') ? acc + name.count('и') : acc
        end
      end
    end
  end
end
