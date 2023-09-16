class Favorite < ApplicationRecord
  belongs_to :user
  has_many :favorite_comments, dependent: :destroy

  scope :published, -> {where(status: true)}
  scope :unpublished, -> {where(status: false)}
end
