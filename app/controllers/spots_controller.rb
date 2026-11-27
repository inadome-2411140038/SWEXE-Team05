class SpotsController < ApplicationController
  def index
    @categories = Category.all
    @spots = Spot.all

    if params[:category_id].present?
      @spots = @spots.where(category_id: params[:category_id])
    end

    if params[:keyword].present?
      @spots = @spots.where("name LIKE ?", "%#{params[:keyword]}%")
    end
  end

  def show
    @spot = Spot.find(params[:id])
    @reviews = @spot.reviews.order(created_at: :desc)
    @review = @spot.reviews.build
  end
end