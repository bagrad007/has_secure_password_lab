class UsersController < ApplicationController
  def new
    find_user
  end

  def create
    user = User.create(user_params)
    if params[:password] != params[:password_confirmation]
      redirect_to "/login"
    else
      session[:user_id] = user.id
      user.authenticate(params[:password])
      redirect_to "/users/new"
    end
  end

  def welcome
    find_user
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

  def find_user
    @user = User.find_by(name: params[:name])
  end
end
