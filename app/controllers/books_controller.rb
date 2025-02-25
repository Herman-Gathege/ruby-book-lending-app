class BooksController < ApplicationController
  before_action :authenticate_user!

  def borrow
    @book = Book.find(params[:id])
    if @book.available?
      Borrowing.create(user: current_user, book: @book, due_date: 2.weeks.from_now)
      redirect_to books_path, notice: "You have borrowed #{@book.title}!"
    else
      redirect_to books_path, alert: "This book is already borrowed!"
    end
  end

  def return
    borrowing = Borrowing.find_by(book_id: params[:id], user_id: current_user.id)
    if borrowing
      borrowing.destroy
      redirect_to books_path, notice: "Book returned successfully!"
    else
      redirect_to books_path, alert: "You haven't borrowed this book!"
    end
  end

  private

  def require_user
    redirect_to login_path unless session[:user_id]
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
