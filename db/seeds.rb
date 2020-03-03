  # This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cleaning database..."

Participation.destroy_all
Answer.destroy_all
Game.destroy_all
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

playlist1 = Playlist.new(name:"Classic Rock", picture:'classicrock.jpg')
playlist2 = Playlist.new(name:"Variété française", picture:'french.jpg')
playlist3 = Playlist.new(name:"Disney", picture:'disney.jpg')
playlist4 = Playlist.new(name:"Années 90", picture:'90s.jpg')
playlist5 = Playlist.new(name:"Rap R&B", picture:'rapus.jpg')
playlist6 = Playlist.new(name:"French touch", picture:'frenchtouch.jpg')

[ playlist1, playlist2, playlist3, playlist4, playlist5, playlist6].each do |playlist|
  playlist.save
  puts "Created #{playlist.name}"
end

track1 = Track.new(title: "Gimme Shelter", artist: "The Rolling Stones", url_preview: "https://cdns-preview-d.dzcdn.net/stream/c-debe09adb05b7e628c7ad2efea3d74cd-6.mp3", playlist_id: playlist1.id)
track2 = Track.new(title: "Another Brick In The Wall", artist: "Pink Floyd", url_preview: "https://cdns-preview-c.dzcdn.net/stream/c-cad0610e7785b919b2771dd13fb329ef-3.mp3", playlist_id: playlist1.id)
track3 = Track.new(title: "London Calling", artist: "The Clash", url_preview: "https://cdns-preview-f.dzcdn.net/stream/c-feb1aded79fa066a1355c2c4ebe40bfb-2.mp3", playlist_id: playlist1.id)
track4 = Track.new(title: "Go Your Own Way", artist: "Fleetwood Mac", url_preview: "https://cdns-preview-c.dzcdn.net/stream/c-c4ecacbbdb8880240d2796565e060bdf-8.mp3", playlist_id: playlist1.id)
track5 = Track.new(title: "Under Pressure", artist: "Queen", url_preview: "https://cdns-preview-1.dzcdn.net/stream/c-1fd0525f2f9cbf39468204210e8c1610-11.mp3", playlist_id: playlist1.id)

track6 = Track.new(title: "La groupie du pianiste", artist: "Michel Berger", url_preview: "https://cdns-preview-f.dzcdn.net/stream/c-fc071a2b3bc797a9793552c60e461806-3.mp3", playlist_id: playlist2.id)
track7 = Track.new(title: "Dejeuner en paix", artist: "Stephan Eicher", url_preview: "https://cdns-preview-6.dzcdn.net/stream/c-660a5b28ca451ba42b1c38a89d93dfad-5.mp3", playlist_id: playlist2.id)
track8 = Track.new(title: "Aicha", artist: "Khaled", url_preview: "https://cdns-preview-f.dzcdn.net/stream/c-fbe21fe13f5fe203ff0cb71b79dc8757-2.mp3", playlist_id: playlist2.id)
track9 = Track.new(title: "Balance ton quoi", artist: "Angèle", url_preview: "https://cdns-preview-c.dzcdn.net/stream/c-ca57b0750b3e6b8f38230a9169f64d73-4.mp3", playlist_id: playlist2.id)
track10 = Track.new(title: "Pour que tu m'aimes encore", artist: "Celine Dion", url_preview: "https://cdns-preview-a.dzcdn.net/stream/c-a480b87e307ebe9a11026eb14a467727-3.mp3", playlist_id: playlist2.id)

track11 = Track.new(title: "Can You Feel the Love Tonight", artist: "Le roi lion", url_preview: "https://cdns-preview-5.dzcdn.net/stream/c-5e4e893751de1f4b4af514bf59f71d3c-6.mp3", playlist_id: playlist3.id)
track12 = Track.new(title: " Libérée, Délivrée ", artist: "La Reine des Neiges", url_preview: "https://cdns-preview-8.dzcdn.net/stream/c-83fb25c04bc36a2c7034d65af631641a-2.mp3", playlist_id: playlist3.id)

track13 = Track.new(title: "Le bilan", artist: "Nèg' Marrons", url_preview: "https://cdns-preview-7.dzcdn.net/stream/c-7148d1048d4211736a61898c98a318af-4.mp3", playlist_id: playlist4.id)

track14 = Track.new(title: "California Love", artist: "2pac", url_preview: "https://cdns-preview-4.dzcdn.net/stream/c-40b01772972d99e577c98d3a41d3d24e-2.mp3", playlist_id: playlist5.id)



[ track1, track2, track3, track4, track5, track6, track7, track8, track9, track10, track11, track12, track13, track14 ].each do |track|
  track.save
  puts "Created #{track.title}"
end

Game.create(status: 0, user: user1 , playlist: playlist3)
p Game.all.last

puts "Finished..."





