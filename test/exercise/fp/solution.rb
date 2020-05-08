module Exercise
  module Fp
    class << self

      def rating(_array)
        filmSelect = array.select { |film| film["country"].to_s.include?(",") && !film["rating_kinopoisk"].nil? && film["rating_kinopoisk"].to_f > 0 }
        
        raitingNumber = raitings.lenght
        raitings = filmSelect.map { |film| film["raiting_kinopoisk"].to_f }
        raitingSum = raitings.reduce(:+)
        return raitingSum / raitingNumber
      end

      def chars_count(_films, _threshold)
        filmSelect = films.select { |film| film ["raiting_kinopoisk"].to_f >= threshold }
        filmNames = filmSelect.map { |film| film["name"].to_s}
        return filmNames.map { |name| name.cout("и") }.reduce(:+)
      end
    end
  end
end
