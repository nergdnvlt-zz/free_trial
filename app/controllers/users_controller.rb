class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  
  def show
    if @user
      session[:fs_account_id] = @user.fs_account_id
      gon.account = @user.fs_account_id
    else
      redirect_to root_path
    end
  end

  def new
    @user = User.new
  end

  def create
    user = User.create!(user_params)
    if user
      redirect_to fastspring_path(user.id)
    else
      redirect_to root_path
    end
  end

  def fastspring
    @user = User.find(params[:id])
    gon.user = @user
    @user
  end

  private

  def set_user
    @user = User.find_by(fs_account_id: params[:fs_account_id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :fs_account_id)
  end
end
