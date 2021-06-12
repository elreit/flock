class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @walk = Walk.find(params[:walk_id])
    select_other_user
  end

  def create
    @review = Review.new(review_params)
    @walk = Walk.find(params[:walk_id])
    select_other_user
    @review.user_id = current_user.id
    @review.reviewee_id = @my_buddy.id
    if @review.save
      redirect_to new_destination_path(current_user)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content, :reviewee_id)
  end

  def select_other_user
    if @walk.buddy_destination.user == current_user
      @my_buddy = @walk.user_destination.user
    else
      @my_buddy = @walk.buddy_destination.user
    end
  end
end
