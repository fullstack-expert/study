module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        ratings = array
          .reject{|film| film["country"] == nil || film["rating_kinopoisk"] == nil }
          .select{|film| film["country"].split(',').size >= 2 }
          .map{|film| film["rating_kinopoisk"].to_f}
          .reject { |rating| rating == 0.0 }

        result = ratings.reduce(:+) / ratings.size
        result
      end

      def chars_count(films, threshold)
        target_films = films.select{|film| film["rating_kinopoisk"].to_f >= threshold}
        result = target_films.reduce(0) { |acc, film| acc + film["name"].count('и')}
        result
      end
    end
  end
end
