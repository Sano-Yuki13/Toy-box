class AddStatusToFavorite < ActiveRecord::Migration[6.1]
  def change
    add_column :favorites, :status, :boolean
  end
end
