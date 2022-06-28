class Tour < ActiveRecord::Base
	belongs_to :category
	has_attached_file :tour_img, styles: { tour_index: "250x350>", tour_show: "325x475>" }, default_url: "/images/:style/missing.png"
   	validates_attachment_content_type :tour_img, content_type: /\Aimage\/.*\z/	
end
