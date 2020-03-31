class AddColumnTotalScoreToParticipations < ActiveRecord::Migration[6.0]
  def change
    add_column :participations, :total_score, :integer
  end
end
