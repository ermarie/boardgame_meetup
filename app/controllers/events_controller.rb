class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.save
    if @event.valid?
      current_user.events << @event
      redirect_to event_path(@event)
    else
      render :new
    end
  end

  def show
    @event = Event.find_by_id(params[:id])
    if @event.users.include?(current_user)
      @attending = true
    else
      @attending = false
    end
  end

  def join
    @event = Event.find_by_id(params[:event_id])
    current_user.events << @event
    redirect_to event_path(@event)
  end

  def leave
    event = Event.find_by_id(params[:event_id])
    current_user.events.delete(event)
    redirect_to user_path(current_user)
  end

  def edit
    @event = Event.find_by_id(params[:id])
  end

  def update
    @event = Event.find_by_id(params[:id])
    @event.update(event_params)
    redirect_to event_path(@event)
  end

  def index
    @events = Event.all
  end

  def destroy
    event = Event.find_by_id(params[:id])
    event.destroy
    redirect_to user_path(current_user)
  end

  private

  def event_params
    params.require(:event).permit(:name, :date_time)
  end
end
