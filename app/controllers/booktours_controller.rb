class BooktoursController < ApplicationController
  layout 'front_end'
  def create
    @booktour = Booktour.new
    @tours = Tour.all
    @booktour.totalprice = Tour.find_by(params[:tour_id]).price * @booktour.nuofgu

        if @booktour.save
            format.js {} 
        end
    
  end
end
