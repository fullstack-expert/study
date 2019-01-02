module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        films_list = array.select { |x| x['rating_kinopoisk'].to_i != 0 && x['country'].to_s.split(',').size >= 2 }
        sum_of_rating = films_list.reduce(0) { |a, e| a + e['rating_kinopoisk'].to_f }
        sum_of_rating / films_list.size
      end

      def chars_count(films, threshold)
        films_list = films.select { |x| x['rating_kinopoisk'].to_f >= threshold.to_f }
        films_list.reduce(0) { |a, e| a + e['name'].scan(/и/).size }
      end
    end
  end
end
