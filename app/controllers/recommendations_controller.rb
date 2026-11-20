class RecommendationsController < ApplicationController
  def index
    @spots = Spot.where(recommended: true)
  end
end