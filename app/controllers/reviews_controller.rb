class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def create
    @drink = Drink.find(params[:drink_id])
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.drink_id = @drink.id

    if @review.save
      redirect_to drink_path(@drink)
    else
      render 'new'
    end
  end

  def review_params
    params.require(:review).permit(:body, :drink_id, :user_id)
  end
end
