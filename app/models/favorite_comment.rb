class FavoriteComment < ApplicationRecord
  belongs_to :user
  belongs_to :favorite
end
