class RemoveVintageFromWines < ActiveRecord::Migration[6.0]
  def change
    remove_column :wines, :vintage
  end
end
