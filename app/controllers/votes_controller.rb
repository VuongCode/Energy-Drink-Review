class VotesController < ApplicationController
  before_action :authenticate_user!

  def create
    @drink = Drink.find(params[:drink_id])
    @review = Review.find(params[:review_id])
    @vote = Vote.new(upvote:vote_params,review:@review,user:current_user)
    if @vote.save
      respond_to do |format|
        format.html { redirect_to drink_path(@drink) }
        format.json
      end
    else
      previous_vote = Vote.find_by(user: current_user, review: @review)
      if @vote.upvote == previous_vote.upvote
        previous_vote.destroy
      else
        previous_vote.update(upvote: @vote.upvote)
      end
      respond_to do |format|
        format.html { redirect_to drink_path(@drink) }
        format.json { score }
      end
    end
  end

  def destroy
  end

  private

  def vote_params
    params.require(:upvote)
  end
end
