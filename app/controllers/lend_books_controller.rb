class LendBooksController < ApplicationController
  def index
    @books = current_user.books
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
    @lend_book.delete
    redirect_to lend_books_path
  end

end
