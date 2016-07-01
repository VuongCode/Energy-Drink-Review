class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def create
    @drink = Drink.find(params[:drink_id])
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.drink_id = @drink.id

    if @review.save
      ReviewMailer.new_review(@review).deliver_later
      redirect_to drink_path(@drink)
    else
      @vote = Vote.new
      redirect_to drink_path(@drink)
    end
  end

  private

  def review_params
    params.require(:review).permit(:body, :rating, :drink_id, :user_id)
  end
end
