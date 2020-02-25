class AddPlaylistToTracks < ActiveRecord::Migration[6.0]
  def change
    add_reference :tracks, :playlist, null: false, foreign_key: true
  end
end
