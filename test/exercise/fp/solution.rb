module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(_array)
      	_array = _array.map {|film| 
		if !film['country'].nil? && 
		   film['country'].split(',').count > 1 && 
		   !film["rating_kinopoisk"].nil? && 
		   film["rating_kinopoisk"].to_f > 0 
		then 
		   film["rating_kinopoisk"].to_f
		else 
		   0 
		end
	}
	_array.delete(0)
        totalRating = _array.reduce {|sum, film_rating| sum + film_rating}
	totalRating / _array.count.to_f
      end

      def chars_count(_films, _threshold)
      	_films = _films.map {|film| 
		if !film["rating_kinopoisk"].nil? && 
		   film["rating_kinopoisk"].to_f >= _threshold 
		then 
		   film["name"]
		else 
		   '' 
		end
	}
	_films.delete('')
        _films.to_s.count('и')
      end
    end
  end
end
