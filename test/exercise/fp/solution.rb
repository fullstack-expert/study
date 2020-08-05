module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(films)
        filtered_films = films
                         .reject { |film| film['country'].nil? }
                         .select { |film| film['country'].split(',').size >= 2 && film['rating_kinopoisk'].to_f.positive? }

        filtered_films.reduce(0.0) { |acc, film| film['rating_kinopoisk'].to_f + acc } / filtered_films.size
      end

      def chars_count(films, threshold)
        films
          .select { |film| film['rating_kinopoisk'].to_f >= threshold }
          .reduce(0) { |acc, film| film['name'].scan('и').size + acc }
      end
    end
  end
end
