module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(_array)
        with_rating = _array.select{ |film| film["rating_kinopoisk"].to_f > 0 if film["rating_kinopoisk"] }
        with_countries = with_rating.select { |el| el["country"].include? ',' if el["country"] }
        rating_sum = with_countries.map { |film| film["rating_kinopoisk"].to_f }.reduce(:+)
        rating_sum / with_countries.length
      end

      def chars_count(_films, _threshold)
        over_threshold = _films.select { |film| film["rating_kinopoisk"].to_f >= _threshold  if film["rating_kinopoisk"] }
        over_threshold.map { |film| film["name"] ? film["name"].count("и") : 0 }.reduce(:+)
      end
    end
  end
end
