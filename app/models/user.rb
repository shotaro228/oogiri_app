class User < ApplicationRecord
  has_many :answers
  has_many :comments
  has_many :likes
  has_many :commentlikes
  
  validates :name, {presence: true}
  validates :email, {presence: true, uniqueness: true}
  validates :password, {presence: true}
  
end
