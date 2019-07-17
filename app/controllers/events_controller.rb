class EventsController < ApplicationController
  def new
    @group = Group.find_by_id(params[:group_id])
    @event = @group.events.build
  end

  def create
    @group = Group.find_by_id(params[:group_id])
    @event = @group.events.build(event_params)
    @event.save
    if @event.valid?
      redirect_to group_event_path(@event.group, @event)
    else
      redirect_to new_group_event_path
    end
  end

  def show
    binding.pry
    @event = Event.find_by_id(params[:id])
  end

  def edit
    @event = Event.find_by_id(params[:id])
  end

  def update
    @event = Event.find_by_id(params[:id])
    @event.update(event_params)
    redirect_to event_path(@event)
  end

  def delete
    event = Event.find_by_id(params[:id])
    event.destroy
  end

  private

  def event_params
    params.require(:event).permit(:name, :date_time)
  end
end
