# frozen_string_literal: true

class RemoveColumnVintageIdFromWines < ActiveRecord::Migration[6.0]
  def change
    remove_column :wines, :vintage_id
  end
end
