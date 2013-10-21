class UsersController < ApplicationController

  def index
    @users = User.all
  end
  
  def new
  	@user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Successfully registered ! Be ready to choose your teams and...wait for more features !"
      redirect_to @user
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :fullname, :age, :avatar_url, :password,
     :password_confirmation)
  end
end