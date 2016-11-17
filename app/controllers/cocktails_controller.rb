class CocktailsController < ApplicationController
  def home
  end
  def index
    @cocktails = Cocktail.all
  end

   def show
    @cocktail=Cocktail.find(params[:id])
    @doses = Dose.find_by cocktail_id:params[:id]
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.create(user_params)
    @doses = @cocktail.doses
    redirect_to cocktail_path(@cocktail)
  end

  private

  def user_params
    params.require(:cocktail).permit(:name, :dose)
  end
end
