module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        rate = array.select { |film| film['country'].to_s.include?(',') &&
                     film["rating_kinopoisk"].present? &&
                     film["rating_kinopoisk"].to_f > 0 }
        result = rate.map { |film| film["rating_kinopoisk"].to_f}
        result.reduce(:+).to_f / rate.length
      end

      def chars_count(films, threshold)
        res = films.select { |film| film['rating_kinopoisk'].to_f >= threshold }              
        res.map { |film| film['name'].count 'и' }.reduce(:+)
      end
    end
  end
end
