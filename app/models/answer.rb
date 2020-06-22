class Answer < ApplicationRecord
  belongs_to :user
  has_many :comments
  
    validates :content, {presence: true, length: {maximum: 140}}
    validates :user_id, {presence: true}
    
end
