class BooksController < ApplicationController

  def index
    @books = current_user.books
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      @user = current_user
      @user.books << @book
      redirect_to books_path, notice: "Successfully added book"
    else
      render 'new'
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    @book.delete
    redirect_to books_path
  end

  def book_params
    params.require(:book).permit(:title, :author)
  end
end
