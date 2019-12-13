module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        films_with_two_countries_and_rating = array.select { |film| film['country'].to_s.include?(',') && film['rating_kinopoisk'].to_f.positive? }

        array_ratings = films_with_two_countries_and_rating.map { |film| film['rating_kinopoisk'].to_f }

        sum_rate = array_ratings.reduce(:+)

        sum_rate / array_ratings.length
      end

      def chars_count(films, threshold)
        films_rating_kinopoisk_more_then_threshold = films.select { |film| film['rating_kinopoisk'].to_f >= threshold }

        films_names = films_rating_kinopoisk_more_then_threshold.map { |film| film['name'].to_s }

        number_chars_in_every_name = films_names.map { |name| name.count('и') }

        number_chars_in_every_name.reduce(:+)
      end
    end
  end
end
