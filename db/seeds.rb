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

def attachUserPicture(user, url)
  picture = URI.open(url)
  user.photo.attach(io: picture, filename: "#{user}avatar.png", content_type: 'image/png')
end
attachUserPicture(alex, "https://avatars1.githubusercontent.com/u/61512090?s=460&u=5e81533ddbf7b9423850a6ec084f6fe96cf56ff0&v=4")
attachUserPicture(madeline, "https://avatars3.githubusercontent.com/u/58431645?s=460&u=ed375a48ce4711c6515ff7d9144d642347ef01de&v=4")
attachUserPicture(ugo, "https://avatars1.githubusercontent.com/u/61455340?s=460&u=24607f97a4138cac3118b27c263a426c1aa1f20c&v=4")
puts 'Finished creating user avatars...'


puts 'Creating vinyls...'

users = [alex, madeline, ugo]
prices = [15, 5, 10, 7, 2, 50]

vinyl1 = Vinyl.new(title: "Thriller", artist: "Michael Jackson", release_date: 1982, address: "44 boulevard Voltaire, Paris", user: ugo, price: prices.sample)
cover1 = URI.open("https://images-na.ssl-images-amazon.com/images/I/91I7blJ8maL._SL1500_.jpg")
vinyl1.photo.attach(io: cover1, filename: "#{vinyl1.title}.jpg", content_type: 'image/jpg')
vinyl1.save
puts "Created #{vinyl1.title}"

vinyl2 = Vinyl.new(title: "Hotel California", artist: "The Eagles", release_date: 1983, address: "75 rue du Faubourg Saint-Martin, Paris", user: ugo, price: prices.sample)
cover2 = URI.open("https://i.pinimg.com/originals/c6/aa/64/c6aa640236695afc1af5e85d61340476.jpg")
vinyl2.photo.attach(io: cover2, filename: "#{vinyl2.title}.jpg", content_type: 'image/jpg')
vinyl2.save
puts "Created #{vinyl2.title}"

vinyl3 = Vinyl.new(title: "Mothership", artist: "Led Zepplin", release_date: 1976, address: "3 rue de Rivoli, Paris", user: ugo, price: prices.sample)
cover3 = URI.open("https://images-na.ssl-images-amazon.com/images/I/81g%2BSqwTwLL._SL1500_.jpg")
vinyl3.photo.attach(io: cover3, filename: "#{vinyl3.title}.jpg", content_type: 'image/jpg')
vinyl3.save
puts "Created #{vinyl3.title}"

vinyl4 = Vinyl.new(title: "The Wall", artist: "Pink Floyd", release_date: 1971, address: "48 rue du Faubourg Saint-Martin, Paris", user: users.sample, price: prices.sample)
cover4 = URI.open("https://m.media-amazon.com/images/I/71BaC3FxeBL._SS500_.jpg")
vinyl4.photo.attach(io: cover4, filename: "#{vinyl4.title}.jpg", content_type: 'image/jpg')
vinyl4.save
puts "Created #{vinyl4.title}"

vinyl6 = Vinyl.new(title: "Swimming", artist: "Mac Miller", release_date: 2009, address: "2 villa Gaudelet, Paris", user: users.sample, price: prices.sample)
cover6 = URI.open("https://images-na.ssl-images-amazon.com/images/I/61R58SHW%2BGL._SL1500_.jpg")
vinyl6.photo.attach(io: cover6, filename: "#{vinyl6.title}.jpg", content_type: 'image/jpg')
vinyl6.save
puts "Created #{vinyl6.title}"

vinyl7 = Vinyl.new(title: "Nevermind", artist: "Nirvana", release_date: 1992, address: "40 rue Oberkampf, Paris", user: users.sample, price: prices.sample)
cover7 = URI.open("https://musikplease.com/wp-content/uploads/sites/17/2016/09/Nevermind_.jpg")
vinyl7.photo.attach(io: cover7, filename: "#{vinyl7.title}.jpg", content_type: 'image/jpg')
vinyl7.save
puts "Created #{vinyl7.title}"

vinyl8 = Vinyl.new(title: "Rumours", artist: "Fleetwood Mac", release_date: 1972, address: "40 rue Amelot, Paris", user: users.sample, price: prices.sample)
cover8 = URI.open("https://upload.wikimedia.org/wikipedia/en/f/fb/FMacRumours.PNG")
vinyl8.photo.attach(io: cover8, filename: "#{vinyl8.title}.png", content_type: 'image/png')
vinyl8.save
puts "Created #{vinyl8.title}"

vinyl9 = Vinyl.new(title: "Appetite", artist: "Guns 'n Roses", release_date: 1985, address: "60 rue Amelot, Paris", user: users.sample, price: prices.sample)
cover9 = URI.open("https://images-na.ssl-images-amazon.com/images/I/71H9ZR6EGFL._SL1400_.jpg")
vinyl9.photo.attach(io: cover9, filename: "#{vinyl9.title}.jpg", content_type: 'image/jpg')
vinyl9.save
puts "Created #{vinyl9.title}"

vinyl10 = Vinyl.new(title: "Legend", artist: "Bob Marley", release_date: 1980, address: "40 rue du Caire, Paris", user: madeline, price: prices.sample)
cover10 = URI.open("https://media.senscritique.com/media/000004841497/source_big/Legend_The_Best_of_Bob_Marley_and_The_Wailers_Compilation.jpg")
vinyl10.photo.attach(io: cover10, filename: "#{vinyl10.title}.jpg", content_type: 'image/jpg')
vinyl10.save
puts "Created #{vinyl10.title}"

vinyl11 = Vinyl.new(title: "Trône", artist: "Booba", release_date: 2017, address: "50 rue du Caire, Paris", user: users.sample, price: prices.sample)
cover11 = URI.open("https://cdn.radiofrance.fr/s3/cruiser-production/2017/12/ad19e11c-8c0a-11e8-a11d-42010ae60007/600_sitesdefaultfiles20171203318378boobatrone.jpg")
vinyl11.photo.attach(io: cover11, filename: "#{vinyl11.title}.jpg", content_type: 'image/jpg')
vinyl11.save
puts "Created #{vinyl11.title}"

vinyl12 = Vinyl.new(title: "Breakfast in America", artist: "Supertramp", release_date: 1979, address: "10 rue d'Aboukir', Paris", user: users.sample, price: prices.sample)
cover12 = URI.open("https://images-na.ssl-images-amazon.com/images/I/91AYdP7NW6L._SL1500_.jpg")
vinyl12.photo.attach(io: cover12, filename: "#{vinyl12.title}.jpg", content_type: 'image/jpg')
vinyl12.save
puts "Created #{vinyl12.title}"

vinyl14 = Vinyl.new(title: "Californication", artist: "Red Hot Chili Peppers", release_date: 2006, address: "30 rue d'Aboukir', Paris", user: users.sample, price: prices.sample)
cover14 = URI.open("https://www.laurentrieppi.com/wp-content/uploads/2011/02/californication1.jpg")
vinyl14.photo.attach(io: cover14, filename: "#{vinyl14.title}.jpg", content_type: 'image/jpg')
vinyl14.save
puts "Created #{vinyl14.title}"
# url = 'https://api.discogs.com/database/search?type=release&format=album&artist=jay-z&key=siCtMCcmTNJxVlEjaFtN&secret=PpLOQJGJITIbrHqGVxhnVMnIMVTwnyRK'

# search_serialized = open(url).read
# search = JSON.parse(search_serialized)

# search['results'].first(10).each do |result|
#   artist_title = result['title'].split(' - ').map(&:strip)
#   cover = URI.open(result["cover_image"])
#   vinyl = Vinyl.new(title: artist_title[1], artist: artist_title[0], release_date: result["year"].to_i, address: result["country"], user: users.sample)
#   vinyl.photo.attach(io: cover, filename: "#{artist_title}.jpeg", content_type: 'image/jpeg')
#   vinyl.save
#   puts "Created #{vinyl.title}"
# end

# puts "-----------------"
# puts "that's all folks!"

# beatles = { title: "Abbey Road", artist: "The Beatles", release_date: 1969, address: "London", user: alex }
# stones = { title: "Aftermath", artist: "The Rolling Stones", release_date: 1966, address: "Paris", user: alex }

# [ beatles, stones ].each do |attributes|
#   vinyl = Vinyl.create!(attributes)
#   puts "Created #{vinyl.title}"
# end
