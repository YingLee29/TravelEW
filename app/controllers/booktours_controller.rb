class BooktoursController < ApplicationController
  layout 'front_end'
  before_action :authority, only: [:update_status]

  def index
    @booktours = current_user.admin? ? Booktour.all : current_user.booktours
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
    @user = current_user
    @booktour = Booktour.new tour_params
    @tours = Tour.all
    tour = Tour.find(params[:id])&.price
    @booktour.user_id = current_user.id
    @booktour.datebook = Time.zone.now
    @booktour.tour_id = params[:id]
    @booktour.totalprice = tour * @booktour.nuofgu
    respond_to do |format|
      if @booktour.save
        TravelMailer.travel_email(@user).deliver_later
        format.html { redirect_to booktours_path }
      else
        format.html { render :new }
      end
        flash[:success] = "Bạn đã đặt tour thành công!"
      end  
  end
  def update_status
    booktour = Booktour.find(params[:id])
    if booktour.confirmed!
      redirect_to booktours_path
    end
  end
  def destroy
    @booktour = Booktour.find(params[:id])
    @booktour.destroy
    flash[:success] = "Tour đã được hủy!"
    redirect_to booktours_path
  end
  
  private
  def tour_params
      params.require(:booktour).permit(:nuofgu)
  end
  def authority
    if !current_user
      redirect_to booktours_path
    elsif !current_user.admin?
      redirect_to booktours_path
    end

  end
end
