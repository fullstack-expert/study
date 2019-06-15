module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(_array)
        films = valid_films(_array,  0)
        ratings = films.map { |f| frating(f) }
        ratings.reduce(:+) / films.length
      end

      def chars_count(_films, _threshold)
        films = filter_rating_eq(_films, _threshold)
        names = films.map { |f| f['name'].to_s }
        names.reduce(0) { |sum, n| sum += n.count('и') }
      end

      private 

      def frating(f)
        f['rating_kinopoisk'].to_f
      end

      def ccount(f)
        f['country'].to_s.split(',').length
      end

      def filter_rating(films, rating)
        films.select { |f| frating(f) > rating }
      end

      def valid_films(films, rating)
        list = filter_rating(films, rating)
        list.select { |f| ccount(f) >= 2 }
      end

      def filter_rating_eq(films, rating)
        films.select { |f| frating(f) >= rating }
      end
    end
  end
end
