class ToursController < ApplicationController
	before_action :authorize, only: [:new, :edit, :update, :destroy]
	before_action :find_tour, only: [:show, :edit, :update, :destroy]

	def index
		@q = Tour.ransack(params[:q])
		@tours = @q.result
		if params[:category_id].nil?
			@tours = @tours.order("created_at DESC")
		else
			@tours = @tours.where(category_id: params[:category_id].to_i).order("created_at DESC")
		end	
	end

	def show
		@q = Tour.ransack(params[:q])
  	@tours = @q.result
		@tour = Tour.find(params[:id])
  	@reviews = Review.where(tour_id: @tour.id).order("created_at DESC")
  	rates = Rate.all.select { |rate| rate.rateable == @tour }
  	if rates.present?
	  	rates_stars = rates.pluck(:stars)
	  	@rate_point = (rates_stars.sum(0.0) / rates_stars.size).round 1
	  else
	  	@rate_point = ""
	  end
	end

	def new
		@q = Tour.ransack(params[:q])
  	@tours = @q.result
		@tour = Tour.new
		@categories = Category.all.map{ |c| [c.name, c.id]}
	end

	def create
		@q = Tour.ransack(params[:q])
  	@tours = @q.result
		@tour = Tour.new(tour_params)
		@tour.category_id = params[:category_id]
		if @tour.save
			redirect_to tours_path
		else
			render 'new'
		end
		
	end

	def edit
		@q = Tour.ransack(params[:q])
  	@tours = @q.result
		@categories = Category.all.map{ |c| [c.name, c.id]}
	end

	def update
		@q = Tour.ransack(params[:q])
  	@tours = @q.result
		@categories = Category.all.map{ |c| [c.name, c.id]}
		if @tour.update(tour_params)
			# flash[:success] = "Update tour thành công!"
			redirect_to tour_path(@tour)	
		else
			render 'edit'
		end
	end

  def update_status
    tour = Tour.find(params[:id])
    tour.status = tour.active? ? 'inactive' : 'active'
    if tour.save
    	redirect_to tours_path
    end
  end

	def destroy
		@q = Tour.ransack(params[:q])
  	@tours = @q.result
		@tour.destroy
		redirect_to root_path
	end

	def booktour
		if !current_user
			redirect_to new_user_session_path
		elsif current_user.admin?
			redirect_to new_user_session_path
		else
			@q = Tour.ransack(params[:q])
			@tour = Tour.find(params[:id])
		end
	end

	private

		def tour_params
			params.require(:tour).permit(:name, :destination, :tourday, :price, :starday, :rated, :category_id, :tour_img, :description)
		end
		def find_tour
			@tour = Tour.find(params[:id])
		end

		def authorize
			if !current_user
				redirect_to new_user_session_path
			elsif !current_user.admin?
				redirect_to new_user_session_path
			end
		end
end
