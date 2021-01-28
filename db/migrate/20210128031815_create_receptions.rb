class CreateReceptions < ActiveRecord::Migration[5.2]
  def change
    create_table :receptions do |t|
      t.references :viewing_time, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
