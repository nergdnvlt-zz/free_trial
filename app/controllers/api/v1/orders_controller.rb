class Api::V1::OrdersController < ApiController
  def create
    if FastspringOrderService.create_order(params[:order_id])
      render json: {"message": "order and account created" }, status: 200
    else 
      render json: {"message": "order and account not created" }, status: 500
    end
  end
end