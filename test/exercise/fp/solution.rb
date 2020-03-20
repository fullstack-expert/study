module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(_array)
        0
      end

      def chars_count(_films, _threshold)
        filtered_films = _films
          .select { |film|
            rating = film["rating_kinopoisk"].to_f
            rating >= _threshold
          }
        
        i_count = filtered_films.reduce(0) { |acc, film|
          film_name = film["name"]
          film_name.each_char { |char|
            char == 'и' && acc += 1
          }
          acc
        }

        i_count
      end
    end
  end
end
