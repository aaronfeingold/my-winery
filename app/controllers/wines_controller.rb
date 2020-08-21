class WinesController < ApplicationController
  before_action :set_wine, except: [:index, :new, :create]
  before_action :logged_in?

  def show
    @wine = Wine.find(params[:id])
  end

  def index
    @user = User.find_by_id(params[:user_id])
    if params[:term]
      @wine = @user.wines.search(params[:term])
    else
      @wines = @user.wines
    end
  end

  def new
    if logged_in?
      @wine = current_user.wines.build  
    else
      @wine = Wine.new
    end 
  end

  def create
    @wine = current_user.wines.build(strong_wine_params)
    # byebug
    if @wine.save
      redirect_to user_wines_path(current_user)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @wine.update(strong_wine_params)
      redirect_to wine_path(@wine)
    else
      render :edit
    end
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
        varietals: [:name]
      )
    end
end