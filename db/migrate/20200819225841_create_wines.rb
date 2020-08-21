class CreateWines < ActiveRecord::Migration[6.0]
  def change
    create_table :wines do |t|
      t.string :name
      t.string :vintage
      t.date :bottled_date
      t.integer :user_id
      t.integer :varietal_id

      t.timestamps
    end
  end
end
