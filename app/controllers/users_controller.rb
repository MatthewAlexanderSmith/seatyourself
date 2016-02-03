class UsersController < ApplicationController
  before_action :load_user, only: [:show, :destroy]
  before_action :ensure_logged_in, only: [:show, :destroy]


  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)

    if @user.save
      redirect_to sessions_new_url, notice: "Sign Up Successful - Please Login"
    else
      render :new
    end
  end

  def show

  end

  def destroy
    @user.destroy
  end

  private
  def user_params
    require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  def load_user
    @user = User.find(params[:id])
  end
end
