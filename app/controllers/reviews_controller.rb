class ReviewsController < ApplicationController
  def confirm
    @spot = Spot.find(params[:spot_id])
    @review = @spot.reviews.build(review_params)

    if @review.valid?
      render :confirm
    else
      @reviews = @spot.reviews.order(created_at: :desc)
      render "spots/show", status: :unprocessable_entity
    end
  end

  def create
    @spot = Spot.find(params[:spot_id])
    @review = @spot.reviews.build(review_params)

    if @review.save
      redirect_to completed_spot_reviews_path(@spot), status: :see_other
    else
      @reviews = @spot.reviews.order(created_at: :desc)
      render "spots/show", status: :unprocessable_entity
    end
  end

  def completed
    @spot = Spot.find(params[:spot_id])
  end

  private

  def review_params
    params.require(:review).permit(:rating, :comment)
  end
end