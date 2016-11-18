class ReviewsController < ApplicationController
  before_action :set_cocktail

  def new
    @review = Review.new
  end

  def create
    @review = Review.create(review_params)
    @review.cocktail = @cocktail
    if @review.save
      @review.save
      @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def review_params
    params.require(:review).permit(:content, :user, :rating)
  end
end
