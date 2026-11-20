class AddRecommendedToSpots < ActiveRecord::Migration[8.1]
  def change
    add_column :spots, :recommended, :boolean, default: false, null: false
  end
end
