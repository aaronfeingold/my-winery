# frozen_string_literal: true

class CreateVintages < ActiveRecord::Migration[6.0]
  def change
    create_table :vintages do |t|
      t.string :vintage_year
      t.string :vintage_notes

      t.timestamps
    end
  end
end
