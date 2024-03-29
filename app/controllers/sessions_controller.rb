# frozen_string_literal: true

class SessionsController < ApplicationController
  def home
    current_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:user][:email])
    if @user&.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to root_path,
                  notice: 'Signed in!'
    else
      flash[:error] = 'Wrong you are, Try again you must'
      redirect_to login_path
    end
  end

  def create
    user = User.find_or_create_from_omniauth(auth)
    session[:user_id] = user.id
    redirect_to root_path
  end

  def destroy
    session.clear
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

  def auth
    request.env['omniauth.auth']
  end
end
