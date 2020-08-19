class CreateVineyards < ActiveRecord::Migration[6.0]
  def change
    create_table :vineyards do |t|
      t.string :name 
      
      t.timestamps
    end
  end
end
