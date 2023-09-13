class RemoveGoodFromFavorites < ActiveRecord::Migration[6.1]
  def change
    remove_column :favorites, :good, :boolean
  end
end
