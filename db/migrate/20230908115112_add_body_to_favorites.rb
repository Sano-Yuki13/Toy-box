class AddBodyToFavorites < ActiveRecord::Migration[6.1]
  def change
    add_column :favorites, :body, :text
  end
end
