class RemoveVarietalIdFromWines < ActiveRecord::Migration[6.0]
  def change
    remove_column :wines, :varietal_id
  end
end
