module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film['name'], film['rating_kinopoisk'], film['rating_imdb'],
      # film['genres'], film['year'], film['access_level'], film['country']
      def rating(array)
        filtered = array.select do |film|
          !film['rating_kinopoisk'].nil? && film['rating_kinopoisk'].to_f.positive? && !film['country'].nil? && film['country'].split(',').length >= 2
        end

        filtered.map { |film| film['rating_kinopoisk'].to_f }.reduce(:+) / filtered.length
      end

      def chars_count(_films, _threshold)
        0
      end
    end
  end
end
