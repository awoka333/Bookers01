class BooksController < ApplicationController

  def start
  end

  def index
    @books = Book.all
  end

  def new
  end

  def create
    @book = Book.new(book_params)
      if @book.save
        flash[:notice] = "Book was successfully created."
        redirect_to '/books/#{@book.id}'
      else
        flash.now[:alart] = "Error occered!!"
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
    book = Book.find(params[:id])
    if book.update(book_params)
      flash[:notice] = "Book was successfully modified."
      redirect_to '/books/#{@book.id}'
    else
      flash.now[:alart] = "Error occered!!"
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end

  private
    def book_params
      params.require(:book).permit(:title, :body)
    end

end