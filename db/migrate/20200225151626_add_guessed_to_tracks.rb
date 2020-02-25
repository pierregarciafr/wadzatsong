class AddGuessedToTracks < ActiveRecord::Migration[6.0]
  def change
    add_column :tracks, :guessed, :boolean, default: false
  end
end
