class PagesController < ApplicationController
  def welcome; end

  def free_trial; end

  def rollover; end

  def freemium; end

  def trial
    @user = User.find_by(fs_account_id: params[:account_id])
  end
end
