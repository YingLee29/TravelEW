class BooktoursController < ApplicationController
  layout 'front_end'
  def index
    @booktours = current_user.booktours
  end

  def show
    @tour = Tour.find(params[:tour_id])
  end

  def new
    participants_num = params[:booktour][:nuofgu].to_i
    @booktour = Booktour.new
    @tour = Tour.find(params[:id])
    @booktour.datebook = Time.zone.now
    @booktour.nuofgu = participants_num
    @booktour.totalprice = @tour.price * participants_num

  end

  def create
    @booktour = Booktour.new tour_params
    @tours = Tour.all
    tour = Tour.find(params[:id])&.price
    @booktour.user_id = current_user.id
    @booktour.datebook = Time.zone.now
    @booktour.tour_id = params[:id]
    @booktour.totalprice = tour * @booktour.nuofgu
    redirect_to booktours_path if @booktour.save
  end
  def destroy
    @booktour = Booktour.find(params[:id])
    @booktour.destroy

    redirect_to booktours_path
  end
  
  private
  def tour_params
      params.require(:booktour).permit(:nuofgu)
  end
end
