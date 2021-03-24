class SessionsController < ApplicationController
  def create
    user = User.find_by(name: params[:user][:name])
    # byebug
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to "/welcome"
    else
      redirect_to "/login"
    end
  end
end

# @user = User.find_by(username: params[:username])
# return head(:forbidden) unless @user.authenticate(params[:password])
# session[:user_id] = @user.id
