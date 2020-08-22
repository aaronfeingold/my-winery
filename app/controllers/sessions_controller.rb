class SessionsController < ApplicationController
 

  def home
    current_user
  end 

  def new 
      @user = User.new 
  end 

  def create
    @user = User.find_by(email: params[:user][:email])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
          redirect_to root_path
      else 
          flash[:error] = "Wrong you are, Try again you must"
          redirect_to login_path 
      end 
  end 

  def githubcreate 
      @user = User.find_or_create_by(uid: auth[:uid]) do |user|
          user.username = auth[:info][:nickname]
          user.email = auth[:info][:nickname] + "@howdoigetaroundthis.com"
          user.password = SecureRandom.hex
      end 
      session[:user_id] = @user.id
      redirect_to concerts_path
  end 

  def destroy 
      session.clear 
      redirect_to root_path
  end 

  private 

  def auth 
      request.env['omniauth.auth']
  end 
end