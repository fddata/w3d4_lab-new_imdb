require 'pg'
require 'pry-byebug'
require_relative 'models/movie.rb'
require_relative 'models/star.rb'
require_relative 'db/sql_runner.rb'

Movie.delete_all() #works
Star.delete_all() #works


movie1 = Movie.new(
  {"title" => "The Blair Witch Project",
  "genre" => "Horror"}
)
movie1.save()

movie2 = Movie.new(
  {"title" => "Sideways",
  "genre" => "Comedy"}
)
movie2.save()

movie3 = Movie.new(
  {"title" => "American Splendour",
  "genre" => "Comedy"}
)
movie3.save()

star1 = Star.new(
  {"first_name" => "Paul",
  'last_name' => "Giamatti"}
)
star1.save()

star2 = Star.new(
  {"first_name" => "Heather",
  'last_name' => "Donahue"}
)
star2.save()




## Console tests here
# movie1.delete() #works

# movie1.title = "blahblah" #works
# movie1.update #works

# star1.first_name = "blahblah" #works
# star1.update #works

#star1.delete #works


binding.pry
nil
