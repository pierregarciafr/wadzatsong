class AddColumnTokenToGames < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :token, :string
  end
end
