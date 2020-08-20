class WinesController < ApplicationController
  before_action :set_wine, except: [:index, :new, :create]

  def show
    @wine = Wine.find(params[:id])
  end

  def index
    @wines = Wine.all
  end

  def new
    @wine = Wine.new
  end

  def create
    Wine.create(strong_wine_params)
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
        :bottled_date,
        vineyard_attributes: [ :name, :varietals ]
      )
    end
end
