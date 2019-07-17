class EventsController < ApplicationController
  def new
    @group = Group.find_by_id(params[:group_id])
    @event = @group.events.build
  end

  def create
    @group = Group.find_by_id(params[:group_id])
    @event = @group.events.build(event_params)
    redirect_to event_path(@event)
  end

  def show
    @event = Event.find_by_id(parmas[:id])
  end

  def edit
    @event = Event.find_by_id(parmas[:id])
  end

  def update
    @event = Event.find_by_id(parmas[:id])
    @event.update(event_params)
    redirect_to event_path(@event)
  end

  def delete
    event = Event.find_by_id(parmas[:id])
    event.destroy
  end

  private

  def event_params
    params.require(:event).permit(:name, :date_time)
  end
end
