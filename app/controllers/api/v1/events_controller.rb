class Api::V1::EventsController < ApiController

  def index
    @events = Event.all
    render :json => {
      :data => @events.map{ |event|
        { :name => event.name,
            :event_url => api_v1_event_url(event.name)
        }
      }
    }
  end

  def show
    @event = Event.find_by_name!( params[:event_name] )

    render :json => {
      :name => @event.name,
      :available_seats => @event.available_seats
    }
  end

end
