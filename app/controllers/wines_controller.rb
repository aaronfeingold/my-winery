class WinesController < ApplicationController
  before_action :set_wine, except: [:index, :new, :create]
  before_action :require_login

  def show
    @wine = Wine.find(params[:id])
  end

  def index
    if params[:user_id]
      @wines = User.find(params[:user_id]).wines 
  else 
      redirect_to wines_path
  end 
  end

  def new
    @wine = Wine.new
  end

  def create
    @wine = current_user.wines.build(strong_wine_params)
    redirect_to wines_path
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
        :vintage,
        :bottled_date
      )
    end
end