class User < ApplicationRecord
  has_many :gists, dependent: :destroy
  has_many :comments
  has_many :followings
  has_many :followers, class_name: 'Following', foreign_key: 'follower_id'
  has_one_attached :profile_image
  has_one_attached :cover_image

  validates :name, presence: true
  validates :username, presence: true, uniqueness: true
  validates :profile_image, attached: true, content_type: ['image/png', 'image/jpeg', 'image/jpg']
  validates :cover_image, attached: true, content_type: ['image/png', 'image/jpeg', 'image/jpg']

  scope :exclude_current_user, ->(id) { where('id != ?', id) }

  def self.who_to_follow(user)
    frnds = user.followings.pluck(:follower_id)
    frnds << user.id
    where.not(id: frnds).order('created_at DESC')
  end

  def self.followed_by(user)
    frnds = user.followers.pluck(:user_id)
    where(id: frnds).order('created_at DESC')
  end
end
