class Favorite < ApplicationRecord
  validates :user_id, uniqueness: true
  validates :book_id, uniqueness: true
  
  belongs_to :user
  belongs_to :book
end
