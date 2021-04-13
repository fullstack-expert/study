module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        filtred = array.select do |e|
          (e['rating_kinopoisk'].present? && e['rating_kinopoisk'].to_f.positive?) &&
            (e['country'].present? && e['country'].split(',').length >= 2)
        end
        ratings_sum = filtred.map { |e| e['rating_kinopoisk'].to_f }.reduce(0, :+)
        ratings_sum / filtred.length
      end

      def chars_count(films, threshold)
        filtred = films.select { |e| e['rating_kinopoisk'].present? && e['rating_kinopoisk'].to_f >= threshold }.map { |e| e['name'].count('и') }
        filtred.reduce(0, :+)
      end
    end
  end
end
