class AdminController < ApplicationController
  def index
  end

  def spots
    @categories = Category.all
    @total_count = Spot.count
    @spots = Spot.all

    if params[:category_id].present?
      @spots = @spots.where(category_id: params[:category_id])
    end

    if params[:keyword].present?
      keyword = "%#{params[:keyword]}%"
      @spots = @spots.where("name LIKE ? OR name_kana LIKE ?", keyword, keyword)
    end

    if params[:recommended] == "true"
      @spots = @spots.where(recommended: true)
    elsif params[:recommended] == "false"
      @spots = @spots.where(recommended: false)
    end

    case params[:sort]
    when "oldest"
      @spots = @spots.order(created_at: :asc)
    when "updated"
      @spots = @spots.order(updated_at: :desc)
    when "kana"
      @spots = @spots.order(:name_kana)
    else
      @spots = @spots.order(created_at: :desc)
    end

    @result_count = @spots.count
  end

  def reviews
  end

  def new
    @spot = Spot.new
    @categories = Category.all
  end

  def create
    @spot = Spot.new(spot_params)

    if @spot.save
      redirect_to admin_spots_path, notice: "観光スポットを登録しました"
    else
      @categories = Category.all
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
      redirect_to admin_spots_path, notice: "観光スポットを更新しました"
    else
      @categories = Category.all
      render :edit, status: :unprocessable_entity
    end
  end

  def delete
    @spot = Spot.find(params[:id])
  end

  def destroy
    @spot = Spot.find(params[:id])
    @spot.destroy
    redirect_to admin_spots_path, notice: "観光スポットを削除しました", status: :see_other
  end

  def delete_image
    @spot = Spot.find(params[:id])

    if @spot.image.attached?
      @spot.image.purge
    end

    redirect_to admin_edit_path(@spot.id), notice: "画像を削除しました", status: :see_other
  end

  private

  def spot_params
    params.require(:spot).permit(:name, :name_kana, :description, :image, :category_id, :recommended)
  end
end