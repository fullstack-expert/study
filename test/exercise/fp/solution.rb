module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(_array)
        rates = []
        _array.each do |i|
          if !i["country"].nil? and !i["rating_kinopoisk"].nil?
            if i["country"].split(',').count > 1 and i["rating_kinopoisk"].to_f > 0
              rates.push(i["rating_kinopoisk"].to_f)
            end
          end
        end
        rates.reduce(:+) / rates.length
      end

      def chars_count(_films, _threshold)
        letters_count = 0
        _films.each do |i|
          if i["rating_kinopoisk"].to_f >= _threshold
            i['name'].split('').each do |c|
              if c == 'и'
                letters_count += 1
              end
            end
          end
        end
        letters_count
      end
    end
  end
end
