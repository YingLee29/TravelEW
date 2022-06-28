class AddAttachmentTourImgToTours < ActiveRecord::Migration[6.1]
  def self.up
    change_table :tours do |t|
      add_column :tours, :tour_img_file_name, :string
      add_column :tours, :tour_img_file_size, :integer
      add_column :tours, :tour_img_content_type, :string
      add_column :tours, :tour_img_updated_at, :datetime  
    end
  end

  def self.down
    remove_column :tours, :tour_img_file_name, :string
    remove_column :tours, :tour_img_file_size, :integer
    remove_column :tours, :tour_img_content_type, :string
    remove_column :tours, :tour_img_updated_at, :datetime
  end
end
