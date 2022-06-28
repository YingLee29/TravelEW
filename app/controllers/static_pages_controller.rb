class StaticPagesController < ApplicationController
  def home
    @q = Tour.ransack(params[:q])
    @tours = @q.result
  end
    
  def help
  end
end
