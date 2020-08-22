class VarietalsController < ApplicationController
  before_action :set_varietal, except: [:index, :new, :create]

  def show
  end

  def index
    @varietals = Varietal.all
  end

  def new
    @varietal = Varietal.new
  end

  def create
    # byebug
    @varietal = Varietal.build(strong_params)
    if @varietal.save 
      redirect_to varietals_path
    else
      flash[:errors] = @varietal.errors.full_messages
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

    def set_varietal
      @varietal = Varietal.find_by_id(params[:id])
    end
    def strong_params
      params.require(:varietal).permit(:name)
    end
end