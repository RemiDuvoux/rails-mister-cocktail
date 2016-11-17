class DosesController < ApplicationController
  def new
    @dose= Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def create
    @dose=Dose.create(user_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail
    if @dose.save
      @dose.save
      redirect_to cocktails_path
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @cocktail = @dose.cocktail
    @dose.delete
    redirect_to cocktail_path(@cocktail)
  end

  private

  def user_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
