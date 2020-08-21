class WinesController < ApplicationController
  before_action :set_wine, except: [:index, :new, :create]
  before_action :logged_in?

  def show
    @wine = Wine.find(params[:id])
  end

  def index
    @user = User.find_by_id(params[:user_id])
    if params[:term]
      @wines = @user.wines.search(params[:term])
    else
      @wines = @user.wines
    end
  end

  def new
    if logged_in?
      @wine = current_user.wines.build
    else
      @wine = Wine.new
      @wines.varietals.build
    end 
  end

  def create
    @wine = current_user.wines.build(strong_wine_params)
    if @wine.save
      redirect_to user_wines_path(current_user)
    else
      render :new
    end
  end

  def edit
    if logged_in?
      @wine = current_user.wines.find_by_id(params[:id])
    else
      flash[:error] = "You must be logged_in in order to do that"
      redirect_to login_path 
    end 
  end

  def update
    @wine = current_user.wines.find_by_id(params[:id])
      if @wine.update(strong_wine_params)
          redirect_to user_wines_path(current_user)
      else
        flash[:error] = "Something has gone vastly wrong"
        render :edit
      end
  end

  def destroy
    @wine = Wine.find(params[:id])
    @wine.destroy
    redirect_to user_wines_path(current_user)
  end

  private

    def set_wine
      @wine = Wine.find_by_id(params[:id])
    end

    def strong_wine_params
      params.require(:wine).permit(
        :name,
        :bottled,
        :bottled_date,
        :varietal_id)
    end
end