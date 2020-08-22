class AddColumnBarrelToWines < ActiveRecord::Migration[6.0]
  def change
    add_column :wines, :barrel, :integer
    add_column :wines, :barrel_location, :string
  end
end
