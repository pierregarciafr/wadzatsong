class AddPictureToPlaylists < ActiveRecord::Migration[6.0]
  def change
    add_column :playlists, :picture, :string
  end
end
