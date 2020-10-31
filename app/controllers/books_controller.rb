class BooksController < ApplicationController

  def start
  end

  def index
    @book = Book.new
    @books = Book.all
  end

  def create
    @book = Book.new(book_params)
      if @book.save
        flash[:notice] = "Book was successfully created."
        redirect_to book_path(@book)
      else
        @books = Book.all
        render :index
      end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "Book was successfully modified."
      redirect_to book_path(@book)
    else
      render "edit"
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[:notice] = "Book was successfully deleted."
    redirect_to books_path
  end

  private
    def book_params
      params.require(:book).permit(:title, :body)
    end

end