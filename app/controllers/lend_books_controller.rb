class LendBooksController < ApplicationController
  def index
    if user_signed_in?
      @lend_books = current_user.lend_books
    else
      redirect_to user_session_path
    end
  end

  # /books/1/lend_books
  def create
    @book = Book.find(params[:book_id])
    @lend_book = LendBook.new

    @lend_book.user = current_user
    @lend_book.book = @book

    if @lend_book.save
      flash[:notice] = "Successfully added book to bookshelf"
    else
      flash[:alert] = "Failed to add book to bookshelf."
    end

    redirect_to lend_books_path
  end

  def destroy
    @lend_book = LendBook.find(params[:id])
    @lend_book.destroy
    redirect_to lend_books_path
  end

end
