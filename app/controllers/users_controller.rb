class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Welcome! You have signed up successfully."
      redirect_to user_path
    else
      render action: :new
    end
  end

  def edit
  	@user = User.find(params[:id])
  end

  def index
    @book = Book.new
    @users = User.all
  end

  def update
  	@user = User.find(params[:id])
     if @user.update(user_params)
        flash[:notice] = "successfully update"
        redirect_to user_path(@user.id)
     else
      render :edit
     end
  end

  private
  def user_params
  	params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
