class AddCategoryToSpots < ActiveRecord::Migration[8.1]
  def change
    add_reference :spots, :category, null: false, foreign_key: true
  end
end
