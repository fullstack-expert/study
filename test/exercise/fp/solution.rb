module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(films)
        films_with_two_or_more_countries = films.select do |film|
          count_film_countries = film["country"].to_s.split(',').size

          count_film_countries > 1
        end

        ratings = films_with_two_or_more_countries
          .map {|film| film["rating_kinopoisk"].to_f}
          .select {|rating| rating > 0}

        sum_of_ratings = ratings.reduce(0) {|acc, rating| acc + rating}

        sum_of_ratings / ratings.size
      end

      def chars_count(_films, _threshold)
        0
      end
    end
  end
end
