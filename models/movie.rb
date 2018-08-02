
class Movie

attr_reader :id
attr_accessor :title, :genre, :budget

  def initialize(options)
    @title = options['title']
    @genre = options['genre']
    @budget = options['budget']
    @id = options['id'].to_i if options['id']
  end

  def save()
    sql = "INSERT INTO movies (title, genre) VALUES ($1, $2) RETURNING id"
    values = [@title, @genre]
    movie_array = SqlRunner.run(sql, values).first
    @id = movie_array['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM movies"
    movies_array = SqlRunner.run(sql)
    return movies_array.map { |movie| Movie.new(movie) }
  end

  def update()
    sql = "UPDATE movies SET (title, genre) = ($1, $2) WHERE id = $3"
    values = [@title, @genre, @id]
    SqlRunner.run(sql, values)
  end

  def stars
    sql = "SELECT stars.* FROM stars INNER JOIN castings
    ON stars.id = castings.star_id
    WHERE castings.movie_id = $1"
    values = [@id]
    stars_array = SqlRunner.run(sql, values)
    return stars_array.map { |star| Star.new(star)  }
  end

  def remaining_budget()
    sql = "SELECT SUM(castings.fee) FROM castings WHERE castings.movie_id = $1"
    values = [@id]
    result = SqlRunner.run(sql, values).first
    return @budget - result['sum'].to_i
  end


  def self.delete_all()
    sql = "DELETE FROM movies"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM movies WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end




end
