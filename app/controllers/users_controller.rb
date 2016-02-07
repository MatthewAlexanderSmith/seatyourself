class UsersController < ApplicationController
  before_action :load_user, only: [:show, :destroy]
  before_action :ensure_logged_in, only: [:show, :destroy]


  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)

    if @user.save
      redirect_to new_session_url, notice: "Sign Up Successful - Please Login"
    else
      render :new
    end
  end

  def show
    gravatar_for(@user)

  end

  def destroy
    @user.destroy
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :owner, :password, :password_confirmation)
  end

  def load_user
    @user = User.find(params[:id])
  end
end
