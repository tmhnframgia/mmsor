class UsersController < ApplicationController

  def index
    @users = User.paginate(page: params[:page], per_page: 10)
  end
  
  def new
  	@user = User.new
  end

  def show
    @user = User.find(params[:id])
    @memberships = @user.memberships.paginate(page: params[:page], per_page: 10)
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
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