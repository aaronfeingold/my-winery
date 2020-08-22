class WinesController < ApplicationController
  before_action :set_wine, except: [:index, :new, :create]
  before_action :set_varietal, only: [:show]
  before_action :current_user
  before_action :logged_in?
  before_action :require_login

  def show
  end

  def index
    if params[:term]
      @wines = current_user.wines.search(params[:term])
    else
      @wines = current_user.wines
    end
  end

  def new
      @wine = current_user.wines.build
  end

  def create
    @wine = current_user.wines.build(strong_wine_params)
    if @wine.save
      flash[:notice] = "Wine successfully created"
      redirect_to user_wines_path(current_user)
    else
      flash[:errors] = @wine.errors.full_messages
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
          redirect_to user_wine_path(params[:id])
      else
        # byebug
        flash[:error] = @wine.errors.full_messages
        render :edit
      end
  end

  def destroy
    @wine.destroy
    redirect_to user_wines_path(current_user)
  end

  private

    def set_wine
      @wine = current_user.wines.find_by_id(params[:id])
    end

    def set_varietal
      @varietal = Varietal.find_by_id(@wine.varietal_id)
    end
    
    def strong_wine_params
      params.require(:wine).permit(
        :name,
        :bottled,
        :bottled_date,
        :varietal_id
        )
    end
end