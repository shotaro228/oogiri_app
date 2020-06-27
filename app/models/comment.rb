class Comment < ApplicationRecord
  belongs_to :answer
  belongs_to :user
  has_many :commentlikes
  
   validates :content, {presence: true, length: {maximum: 140}}
   validates :user_id, {presence: true}
   validates :answer_id, {presence: true}
end
