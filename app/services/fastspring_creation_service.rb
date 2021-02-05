class FastspringCreationService
  def self.build_account_and_order(raw_order_info)
    new(raw_order_info).build_account_and_order
  end

  def build_account_and_order
    return true if add_order(create_user())

    false
  end

  def initialize(fs_order)
    @account_info = fs_order[:recipients][0][:recipient]
    @order_info = {
      fs_order_id: fs_order[:id],
      completed: fs_order[:completed],
      total: fs_order[:total],
      product: fs_order[:items][0]
    }
  end

  def create_user
    user = User.find_or_create_by(email: @account_info[:email]) do |user|
      user.first_name = @account_info[:first]
      user.last_name = @account_info[:last]
      user.fs_account_id = @account_info[:account]
    end
    user
  end

  def add_order(user)
    user.orders.create(
      fs_order_id: @order_info[:fs_order_id],
      product: @order_info[:product][:display],
      product_path: @order_info[:product][:product],
      total: @order_info[:total],
      completed: @order_info[:completed]
    )
    user
  end

end