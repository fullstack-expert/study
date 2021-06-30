module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        selected_films = array.reject { |film| film['rating_kinopoisk'].to_f < 2 || film['country'].nil? }
                              .select { |film| film['country'].split(',').size >= 2 }
                              .map { |film| film['rating_kinopoisk'].to_f }

        selected_films.reduce(:+) / selected_films.size
      end

      def chars_count(films, threshold)
        films.reject { |film| film['rating_kinopoisk'].to_f < threshold || !film['name'].include?('и') }
             .map { |film| film['name'] }
             .map { |name| name.split('').select { |word| word == 'и' }.size }
             .reduce(:+)
      end
    end
  end
end
