class UsersController < ApplicationController
  def show
     @user = current_user.find(params[:id])
  end

  def new
  end
end
