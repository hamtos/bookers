class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:success] = "Book was successfully created"
      redirect_to book_path(book.id)
    else
      @books = Book.all
      render :index
    end
  end

  def index
    @books = Book.all
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:success] = "Book was successfully updated"
      redirect_to book_path(book.id)
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  def show
    @book =Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  private
  # ストロングパラメータ
  def book_params
    params.permit(:title,:body)
  end
end
