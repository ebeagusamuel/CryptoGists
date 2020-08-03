class Gist < ApplicationRecord
  validates :body, presence: true, length: { maximum: 500 }

  belongs_to :user
  has_many :comments, dependent: :destroy
end
