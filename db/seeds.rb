# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cleaning database..."
User.destroy_all
Track.destroy_all
Playlist.destroy_all
puts "Creating users..."

user1 = User.new(password: "password", pseudo: "Mick", email: "mick@jagger.com")
user2 = User.new(password: "password", pseudo: "Gaga", email: "lady@gaga.com")

[ user1, user2 ].each do |user|
  user.save
  puts "Created #{user.pseudo}"
end

playlist1 = Playlist.new(name:"Classic Rock")
playlist2 = Playlist.new(name:"Variété française")
playlist3 = Playlist.new(name:"Disney")
playlist4 = Playlist.new(name:"Années 90")
playlist5 = Playlist.new(name:"RnB US")
playlist6 = Playlist.new(name:"French touch")

[ playlist1, playlist2, playlist3, playlist4, playlist5, playlist6].each do |playlist|
  playlist.save
  puts "Created #{playlist.name}"
end

track1 = Track.new(title: "Under Pressure", artist: "Queen", url_preview: "https://cdns-preview-1.dzcdn.net/stream/c-1fd0525f2f9cbf39468204210e8c1610-11.mp3", playlist_id: playlist1.id)
track2 = Track.new(title: "Another Brick In The Wall", artist: "Pink Floyd", url_preview: "https://cdns-preview-c.dzcdn.net/stream/c-cad0610e7785b919b2771dd13fb329ef-3.mp3", playlist_id: playlist1.id)
track3 = Track.new(title: "Alors on danse", artist: "Stromae", url_preview: "https://cdns-preview-1.dzcdn.net/stream/c-101e682b510b3693698379939bf12c48-10.mp3", playlist_id: playlist1.id)
track4 = Track.new(title: "Marcia Baïla", artist: "Rita Mitsouko", url_preview: "https://cdns-preview-d.dzcdn.net/stream/c-de63cf69f3dcb9f03b9fe6fdb5ea19b9-3.mp3", playlist_id: playlist1.id)
track5 = Track.new(title: "Allumer le feu", artist: "Johnny Hallyday", url_preview: "https://cdns-preview-b.dzcdn.net/stream/c-b4639561980525a1a685c5ed396f45ee-7.mp3", playlist_id: playlist1.id)
track6 = Track.new(title: "Le bilan", artist: "Nèg' Marrons", url_preview: "https://cdns-preview-7.dzcdn.net/stream/c-7148d1048d4211736a61898c98a318af-4.mp3", playlist_id: playlist1.id)
track7 = Track.new(title: "London Calling ", artist: "The Clash", url_preview: "https://cdns-preview-f.dzcdn.net/stream/c-feb1aded79fa066a1355c2c4ebe40bfb-2.mp3", playlist_id: playlist1.id)
track8 = Track.new(title: "California Love", artist: "2pac", url_preview: "https://cdns-preview-4.dzcdn.net/stream/c-40b01772972d99e577c98d3a41d3d24e-2.mp3", playlist_id: playlist1.id)
track9 = Track.new(title: "Go Your Own Way", artist: "Fleetwood Mac", url_preview: "https://cdns-preview-c.dzcdn.net/stream/c-c4ecacbbdb8880240d2796565e060bdf-8.mp3", playlist_id: playlist1.id)
track10 = Track.new(title: "Poker Face", artist: "Lady Gaga", url_preview: "https://cdns-preview-f.dzcdn.net/stream/c-fc31a3c3db5e7283e3a70528f67c89c2-6.mp3", playlist_id: playlist1.id)

[ track1, track2, track3, track4, track5, track6, track7, track8, track9, track10 ].each do |track|
  track.save
  puts "Created #{track.title}"
end



puts "Finished..."
