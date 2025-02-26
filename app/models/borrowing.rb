

class Borrowing < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :due_date, presence: true

  def mark_as_returned
    update(returned_at: Time.current)
  end
end
