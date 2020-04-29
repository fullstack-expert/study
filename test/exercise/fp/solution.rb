module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        rate = array.filter_map { |film| film if film["country"].present? }.
                     filter_map { |film| film if film["rating_kinopoisk"].present? }.
                     filter_map { |film| film if film["rating_kinopoisk"].to_f > 0 }.
                     filter_map { |film| film["rating_kinopoisk"].to_f if film["country"].split(',').length >= 2 }
        result = rate.reduce(0, :+) { |res| res.to_f }
        result / rate.length
      end

      def chars_count(films, threshold)
        res = films.filter_map { |film| film if film["rating_kinopoisk"].present? }.
              filter_map { |film| film["name"] if film["rating_kinopoisk"].to_f >= threshold }.
              map { |name| name.count('и') }
        res.reduce(0, :+) { |name| name }
      end
    end
  end
end
