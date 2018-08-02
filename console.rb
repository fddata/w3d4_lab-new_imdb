require 'pg'
require 'pry-byebug'
require_relative 'models/movie.rb'
require_relative 'db/sql_runner.rb'

Movie.delete_all() #works


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







## Console tests here
# movie1.delete() #works

# movie1.title = "blahblah" #works
# movie1.update #works

binding.pry
nil
