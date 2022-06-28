class AddCategoryIdToTours < ActiveRecord::Migration[6.1]
  def change
    add_column :tours, :category_id, :integer
  end
end
