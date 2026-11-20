class AdminController < ApplicationController
  def index
    @spots = Spot.all
  end

  def new
    @spot = Spot.new
    @categories = Category.all
  end

  def create
    @spot = Spot.new(spot_params)

    if @spot.save
      redirect_to admin_index_path, notice: "観光スポットを登録しました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @spot = Spot.find(params[:id])
    @categories = Category.all
  end

  def update
    @spot = Spot.find(params[:id])

    if @spot.update(spot_params)
      redirect_to admin_index_path, notice: "観光スポットを更新しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def delete
    @spot = Spot.find(params[:id])
  end

  def destroy
    @spot = Spot.find(params[:id])
    @spot.destroy
    redirect_to admin_index_path, notice: "観光スポットを削除しました"
  end

  private

  def spot_params
    params.require(:spot).permit(:name, :description, :image, :category_id, :recommended)
  end
end
