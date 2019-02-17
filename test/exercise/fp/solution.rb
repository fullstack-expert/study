module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(_array)
        ratings = _array.map(&:to_hash).reduce(total: 0, count: 0) do |acc, film|
          if film_has_country_and_rating?(film) && film['country'].split(',').count > 1
            {
              count: acc[:count] + 1,
              total: acc[:total] + film['rating_kinopoisk'].to_f
            }
          else
            acc
          end
        end
        ratings[:total] / ratings[:count]
      end

      def chars_count(_films, _threshold)
        _films.map(&:to_hash).reduce(0) do |acc, film|
          film['rating_kinopoisk'].to_f >= _threshold ? acc + film['name'].count('и') : acc
        end
      end

      private

      def film_has_country_and_rating?(film)
        !(film['country'].nil? || film['rating_kinopoisk'].to_f.zero?)
      end
    end
  end
end
