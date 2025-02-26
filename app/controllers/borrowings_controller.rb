class BorrowingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_book, only: [:borrow, :return]

  def borrow
    if Borrowing.exists?(book: @book)
      redirect_to books_path, alert: "This book is already borrowed!"
    else
      Borrowing.create!(user: current_user, book: @book, due_date: 2.weeks.from_now)
      redirect_to books_path, notice: "You have borrowed #{@book.title}!"
    end
  end

  def return
    borrowing = Borrowing.find_by(book: @book, user: current_user)
    if borrowing
      borrowing.destroy
      redirect_to books_path, notice: "Book returned successfully!"
    else
      redirect_to books_path, alert: "You haven't borrowed this book!"
    end
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end
end
