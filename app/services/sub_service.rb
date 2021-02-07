class SubService
  def initialize(sub_event)
    @fs_event_id = sub_event.fs_event_id
    @sub_info = sub_event.data
    @sub = Subscription.find_by(fs_sub_id: sub_event.data[:subscription])
  end

  def eval_activation
    if @sub
      return @fs_event_id if reconcile_sub
    else
      activate_sub
    end
  end

  def activate_sub
    # Creat account
    # THEN
    # Create new sub
  end

  def reconcile_sub
    @sub.active = @sub_info[:active]
    @sub.state = @sub_info[:state]
    @sub.save
    @sub
  end
end
