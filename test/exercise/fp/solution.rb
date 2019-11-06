module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film['name'], film['rating_kinopoisk'], film['rating_imdb'],
      # film['genres'], film['year'], film['access_level'], film['country']
      def rating(array)
        filtered = array.select do |film|
          film['rating_kinopoisk'].to_f.positive? && film['country'].to_s.split(',').length >= 2
        end

        filtered.map { |film| film['rating_kinopoisk'].to_f }.reduce(:+) / filtered.length
      end

      def chars_count(films, threshold)
        films.reduce(0) do |accum, film|
          accum + film['rating_kinopoisk'].to_f < threshold ? 0 : film['name'].length - film['name'].gsub(/и/, '').length
        end
      end
    end
  end
end
