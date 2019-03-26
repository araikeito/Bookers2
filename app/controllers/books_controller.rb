class BooksController < ApplicationController
  before_action :authenticate_user!, except: [:top]


  def top
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def index
    @book = Book.new
    @books = Book.all
  end

  def new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "book was successfully created."
      redirect_to book_path(@book)
    else
      @books = Book.all
      render :index
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    if book.update(book_params)
      flash[:notice] = "book was successfully update"
    redirect_to book_path(book)
  else
    render action: :new
  end
  end

  def destroy
    book = Book.find(params[:id])
    if book.destroy
      flash[:notice] = "book was successfully destroy"
    redirect_to books_path(book)
  else
    render action: :new
  end
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
