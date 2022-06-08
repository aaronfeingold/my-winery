# frozen_string_literal: true

class CreateVarietals < ActiveRecord::Migration[6.0]
  def change
    create_table :varietals do |t|
      t.string :name

      t.timestamps
    end
  end
end
