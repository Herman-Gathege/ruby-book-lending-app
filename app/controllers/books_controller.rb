class BooksController < ApplicationController
  before_action :authenticate_user!, only: [:borrow, :return, :new, :create]
  before_action :set_book, only: [:show, :borrow, :return]

  def index
    @books = Book.all
  end

  def show
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to @book, notice: "Book added successfully!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def borrow
    if @book.available?
      Borrowing.create!(user: current_user, book: @book, due_date: 2.weeks.from_now)
      redirect_to books_path, notice: "You have borrowed #{@book.title}!"
    else
      redirect_to books_path, alert: "This book is already borrowed!"
    end
  end

  def return
    borrowing = Borrowing.find_by(book_id: @book.id, user_id: current_user.id)
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

  def book_params
    params.require(:book).permit(:title, :author, :description, :isbn)
  end
end
