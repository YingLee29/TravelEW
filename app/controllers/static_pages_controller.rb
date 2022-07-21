class StaticPagesController < ApplicationController
  def index
    @tours = Tour.all
    @booktours = Booktour.where(user_id: current_user.id).booktour("created_at DESC")
    @booktour = Booktour.new
  end

  def home
    @q = Tour.ransack(params[:q])
    @tours = @q.result
  end
    
  def help
  end
end
