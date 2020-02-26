class AddTokenToParticipation < ActiveRecord::Migration[6.0]
  def change
    add_column :participations, :token, :string
  end
end
