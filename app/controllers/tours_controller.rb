class ToursController < ApplicationController
	before_action :authorize, only: [:new, :edit, :update, :destroy]
	before_action :find_tour, only: [:show, :edit, :update, :destroy]

	def index

		if params[:category].blank?
			@tours = Tour.all.order("created_at DESC")
		else
			@category_id = Category.find_by(name: params[:category]).id
			@tours = Tour.where(:category_id => @category_id).order("created_at DESC")
		end
		@q = Tour.ransack(params[:q])
  		@tours = @q.result
	end


	def show
		@tour = Tour.find(params[:id])
		@q = Tour.ransack(params[:q])
  		@tours = @q.result
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
			redirect_to tour_path(@tour)	
		else
			render 'edit'
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
		elsif current_user.role.zero?
			redirect_to new_user_session_path
		else
			@q = Tour.ransack(params[:q])
			@tour = Tour.find(params[:id])
		end
	end

	private

		def tour_params
			params.require(:tour).permit(:name, :destination, :tourday, :price, :starday, :rated, :category_id, :tour_img)
		end
		def find_tour
			@tour = Tour.find(params[:id])
		end

		def authorize
			if !current_user
				redirect_to new_user_session_path
			elsif !current_user.role.zero?
				redirect_to new_user_session_path
			end
		end
end
