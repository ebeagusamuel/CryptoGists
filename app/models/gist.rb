class Gist < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments, dependent: :destroy

  validates :text, presence: true, length: { maximum: 500 }
end
