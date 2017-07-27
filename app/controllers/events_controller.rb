class EventsController < ApplicationController

  def index
    @events = Event.all
    @events = Event.only_public.rank(:row_order).all
  end

  def show
    @event = Event.only_available.find_by_friendly_id!(params[:id])
    @posts = @event.posts
  end

end
