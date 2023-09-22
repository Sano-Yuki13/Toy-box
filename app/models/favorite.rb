class Favorite < ApplicationRecord
  belongs_to :user
  has_many :favorite_comments, dependent: :destroy

  scope :published, -> {where(status: true)}
  scope :unpublished, -> {where(status: false)}

  def self.search(search_word)
   Favorite.where(["title LIKE(?) OR body LIKE(?) OR tag LIKE(?)","%#{search_word}%", "%#{search_word}%", "%#{search_word}%"])
  end
end
