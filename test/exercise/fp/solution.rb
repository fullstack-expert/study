module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        all_ratings = array.map do |film|
          if film['country'].blank? || film['country'].split(',').length < 2 || film['rating_kinopoisk'].to_f.zero?
            nil
          else
            film['rating_kinopoisk'].to_f
          end
        end

        filtered_ratings = all_ratings.compact
        sum = filtered_ratings.reduce(0.0) { |acc, n| acc + n }

        sum / filtered_ratings.length
      end

      def chars_count(films, threshold)
        selected_films = films.select { |film| film['rating_kinopoisk'].to_f >= threshold }

        selected_films.reduce(0) do |acc, film|
          acc + (film['name'].chars.select { |char| char == 'и' }).count
        end
      end
    end
  end
end
