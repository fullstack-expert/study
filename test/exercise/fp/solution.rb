module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]

      def rating(_array)
        
        filtered_films_to_country = _array.map { |film| !film["country"].nil? && film["country"].include?(",") ? film : nil }.compact
       
        filtered_films_unrated = filtered_films_to_country.map { |film| !film["rating_kinopoisk"].nil? && film["rating_kinopoisk"].to_f > 0 ? film : nil}.compact
        
        sum_films_rated = filtered_films_unrated.reduce(0) { |acc, film| acc + film["rating_kinopoisk"].to_f }

        return sum_films_rated / filtered_films_unrated.length
        
      end

      def chars_count(_films, _threshold)
        
        filtred_films_to_rating = _films.map { |film| !film["rating_kinopoisk"].nil? && film["rating_kinopoisk"].to_f >= _threshold ? film : nil }.compact
        array_of_number_of_letters = filtred_films_to_rating.map { |film| film["name"].count("и") }

        return array_of_number_of_letters.reduce(0) { |acc, number| acc + number}
      end
    end
  end
end
