class ChangeAnsweringTimeToFloat < ActiveRecord::Migration[6.0]
  def change
    change_column :answers, :answering_time, :float
  end
end
