class AddUniqueIndexToReceptions < ActiveRecord::Migration[5.2]
  def change
    add_index :receptions, [:user_id, :viewing_time_id], unique: true
  end
end
