class Favorite < ApplicationRecord
  validates :user_id, presence: true
  validates :book_id, presence: true
  validates_uniqueness_of :user_id, scope: :book_id
  
  belongs_to :user
  belongs_to :book
end
