class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.create(event_params)
    redirect_to events_path
  end

  private

  def event_params
    params.require(:event).permit(:title, :content, :start_time).merge(user_id: current_user.id)
  end
end
