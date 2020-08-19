class AddUserIdToWines < ActiveRecord::Migration[6.0]
  def change
    add_column :wines, :user_id, :integer
  end
end
