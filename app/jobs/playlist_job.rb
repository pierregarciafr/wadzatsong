class PlaylistJob < ApplicationJob
  queue_as :default

  def perform(name)

    RSpotify.authenticate(ENV["SPOTIFY_CLIENT_ID"], ENV["SPOTIFY_CLIENT_SECRET"])
    genre = name.downcase
    result_array = RSpotify::Recommendations.generate(limit: 100, seed_genres: ["#{genre}"]).tracks
    result_array.shuffle
    playlist = []
    if name == "French"
      level = 40
      genres = ["chanson", "french pop", "french rock", "nouvelle chanson francaise"]
    elsif name == "Rock"
      level = 65
      genres = ["album rock", "classic rock", "country rock", "rock", "roots rock", "southern rock"]
    elsif name == "Dance"
      level = 70
      genres = ["dance pop", "post-teen pop", "k-pop girl group", "disco"]
    elsif name == "Pop"
      level = 65
      genres = ["permanent wave", "pop", "uk pop"]
    elsif name == "R-N-B"
      level = 70
      genres = ["east coast hip hop", "west coast rap" "gangster rap", "hardcore hip hop", "hip hop", "rap"]
    else
      level = 70
      genres = ["electro", "alternative dance", "new rave", "electro house", "electronica"]
    end

    result_array.each do |track|
      track_result = RSpotify::Track.search("#{track.name}")
        if track_result.first
          if track_result.first.preview_url  && track_result.first.popularity > level && ((track_result.first.artists[0].genres & genres).empty? == false)
            playlist << track_result.first
          end
        end
    end

    new_playlist = Playlist.create(name:name)
    playlist.first(5).each do |track|
      new_track = Track.create(title: "#{track.name}", artist: "#{track.artists[0].name}", url_preview: "#{track.preview_url}")
      new_track.playlist_id = new_playlist.id
      new_track.save
    end

  end
end


