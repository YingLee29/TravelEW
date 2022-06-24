class ToursController < ApplicationController
	before_action :find_book, only: [:show, :edit, :update, :destroy]
	def index
		@tours = Tour.all.order("created_at DESC")
	end
	def show
		# @tour = Tour.find(params[:id])
	end

	def new
		@tour = Tour.new	
	end

	def create
		@tour = Tour.new(tour_params)
		if @tour.save
			redirect_to root_path
		else
			render 'new'
		end
	end

	def edit
		
	end

	def update
		if @tour.update(tour_params)
			redirect_to tour_path(@tour)	
		else
			render 'edit'
		end
	end

	def destroy
		@tour.destroy
		redirect_to root_path
	end

	private

		def tour_params
			params.require(:tour).permit(:name, :destination, :tourday, :price, :starday, :rated)
		end
		def find_book
			@tour = Tour.find(params[:id])
		end
end
