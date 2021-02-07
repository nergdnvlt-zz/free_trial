class WebhookService
  def self.log(request)
    new(request).build_response
  end

  def build_response
    { string: process_ids, status: 202 }
  end

  def initialize(request)
    @events = create_events(request[:events])
  end

  def process_ids
    response_string = ''
    process_events.each_with_index do |event, index|
      response_string << event
      if index != (process_events.length - 1)
        response_string << '\n'
      end
    end
    response_string
  end

  def process_events
    EventService.new(@events).process_all_events
  end

  def create_events(request)
    request.map do |event|
      Event.new(
        fs_event_id: event[:id],
        fs_type: event[:type],
        data: event[:data]
      )
    end
  end
end