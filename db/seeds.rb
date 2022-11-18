# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# require 'faker'

response = URI.open("https://tmdb.lewagon.com/movie/top_rated").read
movies = JSON.parse(response)

puts 'Creating movies...'
movies["results"].each do |movie|
  # byebug
  film = Movie.new(
    title: movie['title'],
    overview: movie["overview"],
    poster_url: movie["poster_path"],
    rating: movie['vote_average']
  )
  film.save
end
puts 'Finished!'
