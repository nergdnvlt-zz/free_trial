class Api::V1::ChargesController < ApiController
  def create
    if FastspringChargeService.create_order(params[:charge_id])
      render json: {"message": "order and account created" }, status: 200
    else 
      render json: {"message": "order and account not created" }, status: 500
    end
  end
end