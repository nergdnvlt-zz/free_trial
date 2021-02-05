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

  private

  def set_user
    @user = User.find_by(fs_account_id: params[:fs_account_id])
  end
end
