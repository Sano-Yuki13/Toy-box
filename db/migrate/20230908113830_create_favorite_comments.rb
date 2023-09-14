class CreateFavoriteComments < ActiveRecord::Migration[6.1]
  def change
    create_table :favorite_comments do |t|

      t.timestamps
      t.integer :user_id
      t.integer :favorite_id
      t.text :comment
    end
  end
end
