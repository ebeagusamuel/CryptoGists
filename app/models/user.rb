class User < ApplicationRecord
  validates :name, presence: true
  validates :username, presence: true, uniqueness: true

  has_one_attached :profile_image
  has_one_attached :cover_image
end
