class User < ApplicationRecord
  has_many :answers
  
  validates :name, {presence: true}
  validates :email, {presence: true, uniqueness: true}
  validates :password, {presence: true}
  
  def answers
    return Answer.where(user_id: self.id)
  end
end
