class SessionsController < ApplicationController
  include SessionsHelper
  before_action :redirect_if_logged_in
  skip_before_action :redirect_if_logged_in, except: [:new, :create]

  def home
    current_user
  end 

  def new 
      @user = User.new 
  end 

  def create
    @user = User.find_by(email: params[:user][:email])
    if @user && @user.authenticate(params[:user][:password])
        login_and_redirect(@user)
    else
        flash[:notice] = "There are errors"
        redirect_to login_path
    end
  end 

  def githubcreate
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
        params.require(:user).permit(:email, :pasword)
    end

    def auth 
        request.env['omniauth.auth']
    end 

    def login_and_redirect(user)
        login_user(user.id)
        redirect_if_logged_in
    end
end