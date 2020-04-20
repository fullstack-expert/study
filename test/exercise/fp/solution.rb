module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(_array)
        sort_table = _array.select { |row| 
                              row["rating_kinopoisk"].to_f > 0 &&  
                              row["country"] != nil &&
                              row["country"].split(',').length > 1 } 
        result = sort_table.reduce(0) { |sum, row| sum + row["rating_kinopoisk"].to_f} / sort_table.count           
        return result
      end

      def chars_count(_films, _threshold)
        result = _films.select {|row| 
                                row['rating_kinopoisk'].to_f > _threshold}.reduce(0) { |sum, row|  
                                sum + row['name'].count('и')}
        return result 
      end
    end
  end
end
