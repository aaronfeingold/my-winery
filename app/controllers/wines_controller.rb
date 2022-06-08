# frozen_string_literal: true

class WinesController < ApplicationController
  before_action :current_user_wines, only: [:index]
  before_action :set_wine, except: %i[index new create]
  before_action :seed_varietals, only: %i[new create edit update]
  before_action :show_varietal, only: [:show]

  before_action :current_user
  before_action :logged_in?
  before_action :require_login

  def show; end

  def index
    if params[:term]
      # use the search method (from wine model)
      @wines = current_user_wines.search(params[:term])
    end
  end

  def new
    @wine = current_user_wines.build
  end

  def create
    @wine = current_user_wines.build(strong_wine_params)
    if @wine.save
      flash[:notice] = 'Wine successfully created'
      redirect_to user_wines_path(current_user)
    else
      flash[:errors] = @wine.errors.full_messages
      render :new
    end
  end

  def edit; end

  def update
    if @wine.update(strong_wine_params)
      redirect_to user_wines_path(current_user)
    else
      flash[:error] = @wine.errors.full_messages
      render :edit
    end
  end

  def destroy
    @wine.destroy if @wine.user_id == current_user.id
    redirect_to user_wines_path(current_user)
  end

  private

  def set_wine
    @wine = current_user.wines.find_by_id(params[:id])
  end

  def show_varietal
    @varietal = Varietal.find_by_id(@wine.varietal_id)
  end

  def seed_varietals
    @varietals = Varietal.all
  end

  def current_user_wines
    @wines = current_user.wines
  end

  def strong_wine_params
    params.require(:wine).permit(
      :name,
      :bottled,
      :bottled_date,
      :barrel,
      :barrel_location,
      :varietal_id,
      varietal_attributes: [:name]
    )
  end
end
