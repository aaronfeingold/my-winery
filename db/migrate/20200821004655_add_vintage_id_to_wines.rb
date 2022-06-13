# frozen_string_literal: true

class AddVintageIdToWines < ActiveRecord::Migration[6.0]
  def change
    add_column :wines, :vintage_id, :integer
  end
end
