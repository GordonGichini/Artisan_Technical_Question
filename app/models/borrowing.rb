class Borrowing < ApplicationRecord
  belongs_to :user
  belongs_to :book

  #Before saving, set the due date (2 weeks from now)
  before_validation :set_due_date, on: :create

  # Before creation, ensure the book is available and mark it unavailable
  before_create :mark_book_unavailable

  # When a borrowing is updated to returned, mark the book as available again
  before_update :mark_book_unavailable, if: :returned_changed_to_true?

  validates :due_date, presence: true 

  private 

  def set_due_date
    self.due_date || 2.weeks.from_now.to_date 
  end

  def mark_book_unavailable
    unless book.available?
      errors.add(:book, "is not available for borrowing")
      throw(:abort)
    end
    # Mark the book as unavailable
    book.update(available: false)
  end

  def mark_book_available
    book.update(available: true)
  end

  def returned_changed_to_true?
    saved_change_to_returned? && returned
  end

end
