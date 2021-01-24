class CreateViewingTimes < ActiveRecord::Migration[5.2]
  def change
    create_table :viewing_times do |t|
      t.date :hold_at, null: false
      t.string :program_name, null: false
      t.integer :capacity

      t.timestamps
    end
    add_index :viewing_times, [:hold_at, :program_name], unique: true
  end
end
