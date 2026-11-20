class HomeController < ApplicationController
  def index
    @spots = Spot.where(recommended: true).limit(3)
    @categories = Category.all
  end
end