module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(films)
        films_content = films_to_a(films)
        array_films = films_content['films']
        country_key = films_content['country']
        rating_key = films_content['rating_kinopoisk']

        filtered_ratings = array_films.reduce([]) do |acc, film|
          rating = film[rating_key].to_f
          countries = film[country_key].to_s
          fit_film = rating > 0 && countries.split(',').length >= 2
          fit_film ? [*acc, rating] : acc
        end

        rating_sum = filtered_ratings.reduce(0) do |acc, rating|
          acc + rating
        end
        rating_sum / filtered_ratings.length
      end

      def chars_count(films, threshold)
        films_content = films_to_a(films)
        array_films = films_content['films']
        name_key = films_content['name']
        rating_key = films_content['rating_kinopoisk']

        filtered_film_names = array_films.reduce([]) do |acc, film|
          name = film[name_key]
          rating = film[rating_key].to_f
          fit_film = rating > threshold
          fit_film ? [*acc, name] : acc
        end

        filtered_film_names.reduce(0) do |acc, name|
          acc + count(name, 'и')
        end
      end

      def films_to_a(films)
        headers = films.headers
        array_films = films.to_a.slice(1, films.count)

        headers_with_index = headers.map.with_index do |header, index|
          [header, index]
        end

        headers_with_index.to_h.merge('films' => array_films)
      end

      def count(str, symbol)
        str.split('').count(symbol)
      end
    end
  end
end
