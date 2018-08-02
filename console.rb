require 'pg'
require 'pry-byebug'
require_relative 'models/movie.rb'
require_relative 'models/star.rb'
require_relative 'models/casting.rb'
require_relative 'db/sql_runner.rb'

Movie.delete_all() #works
Star.delete_all() #works
Casting.delete_all() #works


movie1 = Movie.new(
  {"title" => "The Blair Witch Project",
  "genre" => "Horror",
"budget" => 10000}
)
movie1.save()

movie2 = Movie.new(
  {"title" => "Sideways",
  "genre" => "Comedy",
"budget" => 20000}
)
movie2.save()

movie3 = Movie.new(
  {"title" => "American Splendour",
  "genre" => "Comedy"}
)
movie3.save()

star1 = Star.new(
  {"first_name" => "Heather",
    'last_name' => "Donahue"}

)
star1.save()

star2 = Star.new(
  {"first_name" => "Paul",
  'last_name' => "Giamatti"}
)
star2.save()

star3 = Star.new(
  {"first_name" => "Thomas Haden",
  'last_name' => "Church"}
)
star3.save()

casting1 = Casting.new({
  "star_id" => star1.id,
  "movie_id" => movie1.id,
  "fee" => "500"
  })

casting1.save()

casting2 = Casting.new({
  "star_id" => star2.id,
  "movie_id" => movie2.id,
  "fee" => "1500"
  })

casting2.save()

casting3 = Casting.new({
  "star_id" => star2.id,
  "movie_id" => movie3.id,
  "fee" => "1000"
  })

casting3.save()

casting4 = Casting.new({
  "star_id" => star3.id,
  "movie_id" => movie2.id,
  "fee" => "1000"
  })

casting4.save()




## Console tests here
# movie1.delete() #works

# movie1.title = "blahblah" #works
# movie1.update #works

# star1.first_name = "blahblah" #works
# star1.update #works

#star1.delete #works

# casting1.fee = "10"
# casting1.update


binding.pry
nil
