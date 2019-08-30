class BooksController < ApplicationController

  def top
  end

  def show
  	@book = Book.find(params[:id])
  end

  def index
  	@books = Book.all
  	@book = Book.new
  end


  def new
  	@book = Book.new

  end

  def create
  	@book = Book.new(book_params)
    @books = Book.all
  	if @book.save
		  	flash[:notice]="book was successfully created"
		  	redirect_to book_path(@book)

      else
      render "index"

  	end

  end

  def edit
  	@book = Book.find(params[:id])
  end

  def update
  	@book = Book.find(params[:id])

    if @book.update(book_params)
  	  redirect_to book_path(@book.id)
  	  flash[:notice]="book was successfully updated"
    else
      flash[:notice]="book was not updated"
    end
  end

  def destroy
  	book = Book.find(params[:id])
  	book.destroy
  	redirect_to books_path
  end

  private
  def book_params
  	params.require(:book).permit(:title, :body)
  end

end
