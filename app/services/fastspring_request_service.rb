class FastspringRequestService

  def self.get_order(order_id)
    new(order_id).order_info
  end

  def order_info
    JSON.parse(request.body, symbolize_names: true)
  end

  def initialize(order_id)
    @order_id = order_id
    @base_uri = "https://api.fastspring.com"
    @conn = Faraday.new(@base_uri)
  end

  def request
    @conn.basic_auth(
      Rails.application.credentials.fastspring[:username],
      Rails.application.credentials.fastspring[:password]
    )
    @conn.get("/orders/#{@order_id}")
  end
end