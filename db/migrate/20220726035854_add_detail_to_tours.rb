class AddDetailToTours < ActiveRecord::Migration[6.1]
  def change
    add_column :tours, :detail, :text
  end
end
