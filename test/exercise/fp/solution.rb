require "pry"

module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        values = array.select { |el| el["country"] && el["country"].split(",").count >= 2 }
          .map { |el| el["rating_kinopoisk"].to_f }
          .select { |el| el > 0 }

        values.sum / values.size
      end

      def chars_count(films, threshold)
        films
          .select { |el| el["rating_kinopoisk"].to_f >= threshold }
          .map { |el| el["name"].gsub(/[^и]/, "").size }
          .sum
      end
    end
  end
end
