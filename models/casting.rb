class Casting

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @moive_id = options['movie_id']
    @stars_id = options['stars_id']
    @fee = options['fee']
  end

  

end
