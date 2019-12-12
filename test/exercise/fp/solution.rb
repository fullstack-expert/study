module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        array_raitings_with_nil = array.map do |film|
            if film['country'].to_s.include?(',') && film['rating_kinopoisk'].to_f.positive?
               film['rating_kinopoisk'].to_f
            end
        end

        array_raitings = array_raitings_with_nil.select { |num| num != nil }

        sum_rate = array_raitings.reduce(:+)

        middle_rate = sum_rate/array_raitings.length
      end

      def chars_count(films, threshold)
        array_films_names_with_nil = films.map do |film|
            if film['rating_kinopoisk'].to_f >= threshold
               film['name'].to_s
            end
        end

        array_films_names = array_films_names_with_nil.select { |name| name != nil }

        number_chars_in_every_name = array_films_names.map { |name| name.count('и')}

        result = number_chars_in_every_name.reduce(:+)
      end
    end
  end
end
