class FastspringCreationService
  def self.build_account_and_order(raw_order_info)
    new(raw_order_info).build_account_and_order
  end

  def build_account_and_order
    return true if @user && @sub && @charge

    false
  end

  def initialize(fs_order)
    @account_info = fs_order[:recipients][0][:recipient]
    @sub_info = {
      fs_sub_id: fs_order[:items][0][:subscription],
      product: fs_order[:items][0][:display],
      product_path: fs_order[:items][0][:product],
    }
    @charge_info = {
      fs_charge_id: fs_order[:id],
      completed: fs_order[:completed],
      total: fs_order[:total],
    }
    @user = create_user
    @sub = create_sub
    @charge = create_charge
    binding.pry
  end

  def create_user
    user = User.find_or_create_by(email: @account_info[:email]) do |user|
      user.first_name = @account_info[:first]
      user.last_name = @account_info[:last]
      user.fs_account_id = @account_info[:account]
    end
    user
  end

  def create_sub
    sub = @user.subscriptions.create(
      fs_sub_id: @sub_info[:fs_sub_id],
      product: @sub_info[:product],
      product_path: @sub_info[:product_path],
    )
    sub
  end

  def create_charge
    charge = @sub.charges.create(
      fs_charge_id: @charge_info[:fs_charge_id],
      total: @charge_info[:total],
      completed: @charge_info[:completed],
    )
    charge
  end
end