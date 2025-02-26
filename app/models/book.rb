class Book < ApplicationRecord

  has_many :borrowings # A book can be borrowed multiple times

  validates :title, :author, :isbn, presence: true
  validates :isbn, uniqueness: true

  def available?
    borrowings.where(returned_at: nil).empty?

  end
  
  def return_book
    borrowing = Borrowing.find(params[:id])
    
    if borrowing.returned_at.nil?
      borrowing.mark_as_returned
      render json: { message: "Book returned successfully" }, status: :ok
    else
      render json: { error: "Book has already been returned" }, status: :unprocessable_entity
    end
  end
end

