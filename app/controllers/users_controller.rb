class UsersController < ApplicationController
  layout 'front_end', only: [:index]
  before_action :check_admin, only: [:new, :destroy, :index]
  def profile
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
    #check user co booktour nao k
    if user.booktours.present?
    #co: flash tb loi, return
      flash[:danger] = "Không thể xóa tài khoản đang đặt tour!"
      redirect_to users_index_path
      return

    end
    #ko: tiep tuc
    if user.destroy
      redirect_to users_index_path
    else
      redirect_to root_path
    end
  end

  def get_user_modal
    @user = User.find params[:id]
    
    respond_to do |format|
      format.js
    end
  end

  private

  def check_admin
    if current_user.user?
      redirect_to root_path
    end
  end
end
