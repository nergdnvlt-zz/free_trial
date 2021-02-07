class Event
  attr_reader :fs_event_id, :fs_type, :data
  
  def initialize(attrs)
    @fs_event_id = attrs[:fs_event_id]
    @fs_type = attrs[:fs_type]
    @data = attrs[:data]
  end
end