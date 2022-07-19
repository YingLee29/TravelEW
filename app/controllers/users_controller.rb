class UsersController < ApplicationController
  before_action :check_admin, only: [:new, :destroy, :index]
  def show
     @user = current_user
     @q = Tour.ransack(params[:q]) 
  end

  def index
    @users = User.all
    @q = Tour.ransack(params[:q])
  end

  def new

  end

  def destroy
    user = User.find(params[:id])
    if user.destroy
      redirect_to users_index_path
    else
      redirect_to root_path
    end
  end

  private

  def check_admin
    if current_user.user?
      redirect_to root_path
    end
  end
end
