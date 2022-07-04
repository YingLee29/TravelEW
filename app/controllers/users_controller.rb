class UsersController < ApplicationController
  def show
     @user = current_user
     @q = Tour.ransack(params[:q])
  end

  def new
  end
end
