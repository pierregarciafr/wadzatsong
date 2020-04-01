class PlaylistJob < ApplicationJob
  queue_as :default

  def perform(name)

    RSpotify.authenticate(ENV["SPOTIFY_CLIENT_ID"], ENV["SPOTIFY_CLIENT_SECRET"])
    genre = name.downcase
    result_array = RSpotify::Recommendations.generate(limit: 100, seed_genres: ["#{genre}"]).tracks
    result_array.shuffle
    playlist = []
    if name == "French"
      level = 50
    else
      level = 65
    end

    result_array.each do |track|
      track_result = RSpotify::Track.search("#{track.name}")
        if track_result.first
          if track_result.first.preview_url  && track_result.first.popularity > level
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


