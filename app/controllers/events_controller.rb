class EventsController < ApplicationController

  def new
    @event = Event.new
    @all_users = User.all
  end

  def create
    @event = current_user.created_events.build(event_params)
    if @event.save
      redirect_to user_path(current_user)
    else
      render 'new'
    end
  end

  def index
    @previous_events = Event.previous
    @upcoming_events = Event.upcoming
  end

  def show
    @event = Event.find(params[:id])
  end

  private
    def event_params
      params.require(:event).permit(:location, :date)
    end
end
