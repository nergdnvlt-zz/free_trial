class FastspringChargeService
  def self.create_order(order_id)
    new(order_id).get_order
  end

  def get_order
    create_order(FastspringRequestService.get_order(@order_id))
  end

  def initialize(order_id)
    @order_id = order_id
  end

  def create_order(raw_order_info)
    FastspringCreationService.build_account_and_order(raw_order_info)
  end
end