class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @q = Tour.ransack(params[:q])
    @tours = @q.result
  end

  def create
    tour_id = params[:tour_id].to_i
    @review = Review.new
    @review.user_id = current_user.id
    @review.comment = params[:comment]
    @review.tour_id = tour_id
    @review.date_review = Time.zone.now
    @review.save
    @reviews = Review.where(tour_id: tour_id)
    @users = User.pluck(:id, :name)
    render json: { review: @reviews, users: @users }

  end

  def show
  end

  def index
    @q = Tour.ransack(params[:q])
    @tours = @q.result
    @reviews = Review.where(tour_id: params[:tour_id].to_i)
  end

  def update
  end

  def destroy
  end

  private
    def review_params
      params.require(:review).permit(:comment, :date_review)
    end
end
