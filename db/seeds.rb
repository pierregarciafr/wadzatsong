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
user3 = User.new(password: "password", pseudo: "Ludo", email: "ludo@guesswhat.live")
user4 = User.new(password: "password", pseudo: "Pierre", email: "pierre@guesswhat.live")
user5 = User.new(password: "password", pseudo: "Estelle", email: "estelle@guesswhat.live")
user6 = User.new(password: "password", pseudo: "Bertrand", email: "bertrand@guesswhat.live")

[ user1, user2, user3, user4, user5, user6 ].each do |user|
  user.save
  puts "Created #{user.pseudo}"
end

playlist1 = Playlist.new(name:"Classic Rock", picture:'classicrock.jpg')
playlist2 = Playlist.new(name:"Dancefloor", picture:'rapus.jpg')
playlist3 = Playlist.new(name:"Disney", picture:'disney.jpg')
playlist4 = Playlist.new(name:"Années 90", picture:'90s.jpg')
playlist5 = Playlist.new(name:"Variété française", picture:'french.jpg')
playlist6 = Playlist.new(name:"French touch", picture:'frenchtouch.jpg')

[ playlist1, playlist2, playlist3, playlist4, playlist5, playlist6].each do |playlist|
  playlist.save
  puts "Created #{playlist.name}"
end

track1 = Track.new(title: "Under Pressure", artist: "Queen", url_preview: "https://cdns-preview-1.dzcdn.net/stream/c-1fd0525f2f9cbf39468204210e8c1610-11.mp3", playlist_id: playlist1.id)
track2 = Track.new(title: "Another Brick In The Wall", artist: "Pink Floyd", url_preview: "https://cdns-preview-c.dzcdn.net/stream/c-cad0610e7785b919b2771dd13fb329ef-3.mp3", playlist_id: playlist1.id)
track3 = Track.new(title: "London Calling", artist: "The Clash", url_preview: "https://cdns-preview-f.dzcdn.net/stream/c-feb1aded79fa066a1355c2c4ebe40bfb-2.mp3", playlist_id: playlist1.id)
track4 = Track.new(title: "Go Your Own Way", artist: "Fleetwood Mac", url_preview: "https://cdns-preview-c.dzcdn.net/stream/c-c4ecacbbdb8880240d2796565e060bdf-8.mp3", playlist_id: playlist1.id)
track5 = Track.new(title: "Gimme Shelter", artist: "The Rolling Stones", url_preview: "https://cdns-preview-d.dzcdn.net/stream/c-debe09adb05b7e628c7ad2efea3d74cd-6.mp3", playlist_id: playlist1.id)

track6 = Track.new(title: "La groupie du pianiste", artist: "Michel Berger", url_preview: "https://cdns-preview-f.dzcdn.net/stream/c-fc071a2b3bc797a9793552c60e461806-3.mp3", playlist_id: playlist2.id)
track7 = Track.new(title: "Dejeuner en paix", artist: "Stephan Eicher", url_preview: "https://cdns-preview-6.dzcdn.net/stream/c-660a5b28ca451ba42b1c38a89d93dfad-5.mp3", playlist_id: playlist2.id)
track8 = Track.new(title: "Place des grands hommes", artist: "Patrick Bruel", url_preview: "https://cdns-preview-1.dzcdn.net/stream/c-11d15f3244a2b2bd079ba020988b608a-4.mp3", playlist_id: playlist2.id)
track9 = Track.new(title: "Balance ton quoi", artist: "Angèle", url_preview: "https://cdns-preview-c.dzcdn.net/stream/c-ca57b0750b3e6b8f38230a9169f64d73-4.mp3", playlist_id: playlist2.id)
track10 = Track.new(title: "Pour que tu m'aimes encore", artist: "Celine Dion", url_preview: "https://cdns-preview-a.dzcdn.net/stream/c-a480b87e307ebe9a11026eb14a467727-3.mp3", playlist_id: playlist2.id)

track11 = Track.new(title: "Can You Feel the Love Tonight", artist: "Le roi lion", url_preview: "https://cdns-preview-5.dzcdn.net/stream/c-5e4e893751de1f4b4af514bf59f71d3c-6.mp3", playlist_id: playlist3.id)
track12 = Track.new(title: "Libérée, Délivrée", artist: "La Reine des Neiges", url_preview: "https://cdns-preview-8.dzcdn.net/stream/c-83fb25c04bc36a2c7034d65af631641a-2.mp3", playlist_id: playlist3.id)
track13 = Track.new(title: "Hakuna Matata", artist: "Le roi lion", url_preview: "https://cdns-preview-9.dzcdn.net/stream/c-90d7ec2c8ee16b0596b5bf3e9065bfa1-6.mp3", playlist_id: playlist3.id)
track14 = Track.new(title: "Sifflez en travaillant", artist: "Blanche neige", url_preview: "https://cdns-preview-3.dzcdn.net/stream/c-32015dc1ff4854f9ef14e7edd55bcc5c-7.mp3", playlist_id: playlist3.id)
track15 = Track.new(title: "Comme un homme", artist: "Mulan", url_preview: "https://cdns-preview-2.dzcdn.net/stream/c-208959084664cb88f244aa99010c8458-5.mp3", playlist_id: playlist3.id)

track16 = Track.new(title: "Wonderwall", artist: "Oasis", url_preview: "https://cdns-preview-d.dzcdn.net/stream/c-dea9ce7355e368915b5e1577e7b7dc6f-2.mp3", playlist_id: playlist4.id)
track17 = Track.new(title: "I Will Always Love You", artist: "Whitney Houston", url_preview: "https://cdns-preview-7.dzcdn.net/stream/c-7a42593ecbb6884418d6b1b2db3a4c8e-2.mp3", playlist_id: playlist4.id)
track18 = Track.new(title: "Baby One More Time", artist: "Britney Spears", url_preview: "https://cdns-preview-c.dzcdn.net/stream/c-cd9497093c088d198b226e058044787d-4.mp3", playlist_id: playlist4.id)
track19 = Track.new(title: "Wannabe", artist: "Spice Girls", url_preview: "https://cdns-preview-d.dzcdn.net/stream/c-d6ef220200cf4b1a3fc7b5093dd403a9-7.mp3", playlist_id: playlist4.id)
track20 = Track.new(title: "Smells Like Teen Spirit", artist: "Nirvana", url_preview: "https://cdns-preview-3.dzcdn.net/stream/c-358eb79e55e30b4719d976e15d41e230-6.mp3", playlist_id: playlist4.id)

track21 = Track.new(title: "Ces soirées la", artist: "Yannick", url_preview: "https://cdns-preview-d.dzcdn.net/stream/c-d4f21daccee31ed7ef3ed24fccceea95-4.mp3", playlist_id: playlist5.id)
track22 = Track.new(title: "It's raining men", artist: "Weather girls", url_preview: "https://cdns-preview-b.dzcdn.net/stream/c-b784a20409fe9d1c6bf6e7f312b71788-4.mp3", playlist_id: playlist5.id)
track23 = Track.new(title: "Wannabe", artist: "Spice Girls", url_preview: "https://cdns-preview-d.dzcdn.net/stream/c-d6ef220200cf4b1a3fc7b5093dd403a9-7.mp3", playlist_id: playlist5.id)
track24 = Track.new(title: "Dancing queen", artist: "Abba", url_preview: "https://cdns-preview-8.dzcdn.net/stream/c-8708a478849e903d5065f4c9caaf8641-13.mp3", playlist_id: playlist5.id)
track25 = Track.new(title: "Baby One More Time", artist: "Britney Spears", url_preview: "https://cdns-preview-c.dzcdn.net/stream/c-cd9497093c088d198b226e058044787d-4.mp3", playlist_id: playlist5.id)

track26 = Track.new(title: "Around the World", artist: "Daft Punk", url_preview: "https://cdns-preview-a.dzcdn.net/stream/c-a2ce94cf0655f6cb526e94f5c046b7d5-6.mp3", playlist_id: playlist6.id)
track27 = Track.new(title: "Sexy Boy", artist: "Air", url_preview: "https://cdns-preview-e.dzcdn.net/stream/c-eae6dede7f3d6501df832dc810c89476-6.mp3", playlist_id: playlist6.id)
track28 = Track.new(title: "Lisztomania", artist: "Phoenix", url_preview: "https://cdns-preview-9.dzcdn.net/stream/c-9aa7c2d5711a7b042a24efbd96606d53-2.mp3", playlist_id: playlist6.id)
track29 = Track.new(title: "Nightcall", artist: "Kavinski", url_preview: "https://cdns-preview-9.dzcdn.net/stream/c-9f86709aec7ca6f1f13d47e8492be971-9.mp3", playlist_id: playlist6.id)
track30 = Track.new(title: "Flat Beat", artist: "Mister Oizo", url_preview: "https://cdns-preview-b.dzcdn.net/stream/c-b7fdcbb9ae75b759893dbf47cc14380e-6.mp3", playlist_id: playlist6.id)



[ track1, track2, track3, track4, track5, track6, track7, track8, track9, track10, track11, track12, track13, track14, track15, track16, track17, track18, track19, track20, track21, track22, track23, track24, track25, track26, track27, track28, track29, track30 ].each do |track|
track.save
puts "Created #{track.title}"
end

Game.create(status: 0, user: user1 , playlist: playlist3)
p Game.all.last

puts "Finished..."





