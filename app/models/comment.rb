class Comment < ApplicationRecord
  validates :body, presence: true, length: { maximum: 200, too_long: "Your comment can't be more than 200 characters" }

  belongs_to :user
  belongs_to :gist
end
