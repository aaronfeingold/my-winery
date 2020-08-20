class WinesController < ApplicationController

  def show
    @wine = Wine.find(params[:id])
  end

  def index
    @wines = Wine.all
  end

  def new
    @wine = Wine.new
    @wine.vineyards.build(name: "Vineyard 1")
  end

  def create
    binding.pry
    wine.create(wine_params)
    redirect_to wines_path
  end

  private
  def wine_params
    params.require(:wine).permit(
      :name,
      vineyard_attributes: [ :name, :varietals ]
    )
  end
end
