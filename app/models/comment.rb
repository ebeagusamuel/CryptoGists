class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :gist

  validates :body, presence: true, length: { maximum: 200, too_long: "Your comment can't be more than 200 characters" }
end
