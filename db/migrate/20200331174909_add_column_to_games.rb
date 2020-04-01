class AddColumnToGames < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :total_score, :integer
  end
end
