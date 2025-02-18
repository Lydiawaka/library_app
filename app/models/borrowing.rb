class Borrowing < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :user_id, :book_id, :due_date, presence: true
  validate :book_availability

  def book_availability
    errors.add(:book_id, "is already borrowed") if book.borrowings.exists?
  end
end
