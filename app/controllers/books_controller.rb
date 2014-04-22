class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
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

  def search
    @books = filter_books(params)
  end

  private

  def filter_books(params)
    Book.search(params[:search])
  end

  def book_params
    params.require(:book).permit(:title, :author)
  end
end
