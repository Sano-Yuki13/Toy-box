class AddTagToFavorites < ActiveRecord::Migration[6.1]
  def change
    add_column :favorites, :tag, :string
  end
end
