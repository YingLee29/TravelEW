class TravelMailer < ApplicationMailer
	def travel_email(user)
	  @user = user
	  mail(to: @user.email, subject: "TravelEW Email")
	end
end
