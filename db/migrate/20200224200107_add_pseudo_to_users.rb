class AddPseudoToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :pseudo, :string
  end
end
