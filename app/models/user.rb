class User < ApplicationRecord
  has_many :answers
  has_many :comments
  has_many :likes
  has_many :commentlikes
  has_many :follows
  has_many :followings, through: :follows, source: :follow
  has_many :reverse_of_follows, class_name: 'Follow', foreign_key: 'follow_id'
  has_many :followers, through: :reverse_of_follows, source: :user
  
  validates :name, {presence: true}
  validates :email, {presence: true, uniqueness: true}
  validates :password, {presence: true}
  
  mount_uploader :avatar, AvatarUploader
  
  def follow(other_user)
    unless self == other_user
      self.follows.find_or_create_by(follow_id: other_user.id)
    end
  end

  def unfollow(other_user)
    follow = self.follows.find_by(follow_id: other_user.id)
    follow.destroy if follow
  end

  def following?(other_user)
    self.followings.include?(other_user)
  end
  
end
