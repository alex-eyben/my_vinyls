# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Cleaning database..."
Vinyl.destroy_all

puts 'Creating vinyls...'
beatles = { title: "Abbey Road", artist: "The Beatles", release_date: 1969, address: "London", user_id: 1 }
stones = { title: "Aftermath", artist: "The Rolling Stones", release_date: 1966, address: "Paris", user_id: 1 }

[ beatles, stones ].each do |attributes|
  vinyl = Vinyl.create!(attributes)
  puts "Created #{vinyl.title}"
end
puts "Finished!"

