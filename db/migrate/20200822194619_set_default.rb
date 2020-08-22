class SetDefault < ActiveRecord::Migration[6.0]
  def change
    def change
      change_column :wine, :wines, :boolean, default: false
    end
  end
end
