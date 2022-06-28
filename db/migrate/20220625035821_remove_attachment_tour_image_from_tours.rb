class RemoveAttachmentTourImageFromTours < ActiveRecord::Migration[6.1]
  def change
    remove_column :tours, :attachment_tour_image, :string
  end
end
