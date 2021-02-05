class Api::V1::AccountsController < ApiController
  def show
    auth_url = PreAuthService.get(params[:account_id])
    if auth_url
      render json: {"url": auth_url }, status: 200
    else
      render json: {"message": "account not created" }, status: 500
    end
  end
end