class AddTitleToFavorites < ActiveRecord::Migration[6.1]
  def change
    add_column :favorites, :title, :string
  end
end
