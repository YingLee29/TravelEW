class ReviewsController < ApplicationController
  def new
  end

  def create
    tour_id = params[:tour_id].to_i
    @review = Review.new
    @review.user_id = current_user.id
    @review.comment = params[:comment]
    @review.tour_id = tour_id
    @review.date_review = Time.zone.now
    @review.save
    render json: { review: @review, user: @review.user}
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
    tour = Tour.find(params[:tour_id])
    review = tour.reviews.find(params[:id])
    if review.destroy
      redirect_to tour_path(review.tour)
    else
      redirect_to root_path
    end
  end
end
