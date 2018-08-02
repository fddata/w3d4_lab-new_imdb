class Casting

  attr_reader :id, :movie_id, :stars_id
  attr_accessor :fee

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @movie_id = options['movie_id'].to_i()
    @star_id = options['star_id'].to_i()
    @fee = options['fee'].to_i()
  end

  def save()
    sql = "INSERT INTO castings (movie_id, star_id, fee) VALUES ($1, $2, $3) RETURNING id"
    values = [@movie_id, @star_id, @fee]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i()
  end

  def self.all()
    sql = "SELECT * FROM castings"
    castings_array = SqlRunner.run(sql)
    return castings_array.map { |casting| Casting.new(casting)  }
  end

  def update
    sql = "UPDATE castings SET fee = $1 WHERE id = $2"
    values = [@fee, @id]
    SqlRunner.run(sql, values)

  end

  def self.delete_all
    sql = "DELETE FROM castings"
    SqlRunner.run(sql)
  end

  def delete
    sql = "DELETE FROM castings WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end


end
