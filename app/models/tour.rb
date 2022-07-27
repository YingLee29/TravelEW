class Tour < ActiveRecord::Base
	ratyrate_rateable "name"
	enum status: {active: 0, inactive: 1 }
	belongs_to :category
	has_many :booktours
	has_many :reviews
	has_rich_text :description
	has_attached_file :tour_img, styles: { tour_index: "250x350>", tour_show: "325x475>" }, default_url: "/images/:style/missing.png"
   	validates_attachment_content_type :tour_img, content_type: /\Aimage\/.*\z/	

   	def status_i18n
   		I18n.t("enums.tour.status.#{status}")
   	end
end
