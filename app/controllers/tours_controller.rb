class ToursController < ApplicationController
	before_action :find_tour, only: [:show, :edit, :update, :destroy]
	def index
		# @q = Tour.ransack(params[:q])
  # 	@tours = @q.result

		if params[:category].blank?
			@tours = Tour.all.order("created_at DESC")
		else
			@category_id = Category.find_by(name: params[:category]).id
			@tours = Tour.where(:category_id => @category_id).order("created_at DESC")
		end
	end

	def show
		@tour = Tour.find(params[:id])
	end

	def new
		@tour = Tour.new
		@categories = Category.all.map{ |c| [c.name, c.id]}
	end

	def create
		@tour = Tour.new(tour_params)
		@tour.category_id = params[:category_id]
		if @tour.save
			redirect_to tours_path
		else
			render 'new'
		end
	end

	def edit
		@categories = Category.all.map{ |c| [c.name, c.id]}
	end

	def update
		@categories = Category.all.map{ |c| [c.name, c.id]}
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
			params.require(:tour).permit(:name, :destination, :tourday, :price, :starday, :rated, :category_id, :tour_img)
		end
		def find_book
			@tour = Tour.find(params[:id])
		end
end
