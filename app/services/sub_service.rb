class SubService
  def initialize(sub_event)
    @type = sub_event.fs_type
    @id = sub_event.fs_id
    @sub_info = sub_event.data.symbolize_keys
    @sub = sub
    binding.pry
  end

  def eval_activation
    if !@sub_info[:customReferenceId]
      activate_sub
    else
      reconcile_sub
    end
  end

  def activate_sub
    # Create new sub
  end

  def reconcile_sub
    # If sub exists
  end
end
