# frozen_string_literal: true

class AddColumnBottledToWines < ActiveRecord::Migration[6.0]
  def change
    add_column :wines, :bottled, :boolean
    add_column :wines, :varietal_id, :integer
  end
end
