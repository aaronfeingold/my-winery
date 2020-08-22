class UsersController < ApplicationController
  before_action :require_login, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    if user_params[:password] == user_params[:password_confirmation]
      @user = User.new(user_params)
        if @user.save
          session[:user_id] = @user.id
          redirect_to root_path
        else
          flash[:errors] = @user.errors.full_messages
          render :new
        end
    else 
        @user = User.new
        flash[:errors] = @user.errors.full_messages
        render :new
    end
  end

  def show
    if current_user.id == params[:id].to_i
      render :show
    else
      flash[:alert] = "You don't have permission to access that profile"
      redirect_to user_path(current_user.id)
    end
  end

  def edit
    if current_user.id == params[:id].to_i
      render :edit
    else
      flash[:alert] = "You don't have permission to edit that profile"
      redirect_to user_path(current_user.id)
    end
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), {notice: "#{@user.email}, your " \
        "profile has been updated"}
    else
      render :edit
    end
  end

  def destroy
    @user.update_room_inventory
    @user.destroy
    redirect_to root_path, {notice: 'Your account has been deleted' }
  end

  private
  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(
      :email,
      :password,
      :password_confirmation,
      :name
    )
  end
end