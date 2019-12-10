module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(_array)
        new_array = array.map { |film["country"]| film["country"] > 1 ? film : nil }
        array.reduce(0) { |sum, film["rating_kinopoisk"]| sum + film["rating_kinopoisk"] }
      end

      def chars_count(_films, _threshold)
        0
      end
    end
  end
end
