module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        newtable = array.select { |row| 
                              row["rating_kinopoisk"].to_f > 0 &&  
                              row["country"] != nil &&
                              row["country"].split(',').length > 1 } 
        newtable.reduce(0) { |sum, row| sum + row["rating_kinopoisk"].to_f} / newtable.count           
      end

      def chars_count(films, threshold)
        films.select {|row| 
                          row['rating_kinopoisk'].to_f > threshold}.reduce(0) { |sum, row|  
                          sum + row['name'].count('и')}
      end
    end
  end
end
