# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'

puts "Cleaning database..."
Booking.destroy_all
Vinyl.destroy_all
User.destroy_all

puts 'Creating users...'
alex = User.create!(email: "alex@lewagon.org", password: "password")
madeline = User.create!(email: "madeline@lewagon.org", password: "password")
ugo = User.create!(email: "ugo@lewagon.org", password: "password")
puts 'Finished creating users...'

puts 'Creating vinyls...'

url = 'https://api.discogs.com/database/search?type=release&format=album&key=siCtMCcmTNJxVlEjaFtN&secret=PpLOQJGJITIbrHqGVxhnVMnIMVTwnyRK'

search_serialized = open(url).read
search = JSON.parse(search_serialized)
users = [alex, madeline, ugo]

search['results'].first(10).each do |result|
  artist_title = result['title'].split('-').map(&:strip)
  cover = URI.open(result["cover_image"])
  # Cover image is here : result["cover_image"]
  # also a smaller one here : result["thumb"]
  vinyl = Vinyl.new(title: artist_title[1], artist: artist_title[0], release_date: result["year"].to_i, address: result["country"], user: users.sample)
  vinyl.photo.attach(io: cover, filename: "#{artist_title}.jpeg", content_type: 'image/jpeg')
  vinyl.save
  puts "Created #{vinyl.title}"
end

puts "-----------------"
puts "that's all folks!"

# beatles = { title: "Abbey Road", artist: "The Beatles", release_date: 1969, address: "London", user: alex }
# stones = { title: "Aftermath", artist: "The Rolling Stones", release_date: 1966, address: "Paris", user: alex }

# [ beatles, stones ].each do |attributes|
#   vinyl = Vinyl.create!(attributes)
#   puts "Created #{vinyl.title}"
# end
