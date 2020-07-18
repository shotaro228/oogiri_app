class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question
  has_many :comments
  has_many :likes
  
    validates :content, {presence: true, length: {maximum: 140}}
    validates :user_id, {presence: true}
    
end
