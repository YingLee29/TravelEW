class RemoverateFromreviews < ActiveRecord::Migration[6.1]
  def change
    remove_column :reviews, :rate
  end
end
