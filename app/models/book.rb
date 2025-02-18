class Book < ApplicationRecord
  # Associations
  has_many :borrowings
  has_many :users, through: :borrowings

  validates :title, :author, :isbn, presence: true
  validates :isbn, uniqueness: true
end
