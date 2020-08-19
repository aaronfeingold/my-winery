class CreateVarietals < ActiveRecord::Migration[6.0]
  def change
    create_table :varietals do |t|
      t.string :name
      t.integer :wine_id
      t.integer :vineyard_id

      t.timestamps
    end
  end
end
