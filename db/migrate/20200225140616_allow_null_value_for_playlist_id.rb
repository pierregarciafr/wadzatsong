class AllowNullValueForPlaylistId < ActiveRecord::Migration[6.0]
  def change
    change_column_null :games, :playlist_id, true
  end
end
