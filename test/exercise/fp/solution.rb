module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(_array)
        films = _array.select { |f| f["rating_kinopoisk"].to_f > 0 && f["country"].to_s.split(",").size > 1 }
        ratings = films.reduce (0) { |acc, f| acc + f["rating_kinopoisk"].to_f }
        ratings / films.size
      end

      def chars_count(_films, _threshold)
        _films.select { |f| f["rating_kinopoisk"].to_f >= _threshold }
              .reduce (0) { |acc, f| acc + f["name"].chars.select { |c| c.eql?("и") }.size }
      end
    end
  end
end
